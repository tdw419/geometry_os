; DESCRIPTION: Renders a magenta box of size 60x61 starting at (233, 21).
; PLAN: r0=233(x), r1=21(y), r2=60(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 21
LDI r2, 60
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
