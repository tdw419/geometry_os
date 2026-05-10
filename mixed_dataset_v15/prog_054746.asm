; DESCRIPTION: Renders a magenta box of size 105x60 starting at (373, 132).
; PLAN: r0=373(x), r1=132(y), r2=105(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 132
LDI r2, 105
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
