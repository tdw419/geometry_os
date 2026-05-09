; DESCRIPTION: Renders a magenta box of size 60x27 starting at (373, 57).
; PLAN: r0=373(x), r1=57(y), r2=60(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 57
LDI r2, 60
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
