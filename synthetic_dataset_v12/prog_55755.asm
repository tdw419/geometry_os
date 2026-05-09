; DESCRIPTION: Renders a purple box of size 24x16 starting at (357, 80).
; PLAN: r0=357(x), r1=80(y), r2=24(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 80
LDI r2, 24
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
