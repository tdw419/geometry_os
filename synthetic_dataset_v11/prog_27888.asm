; DESCRIPTION: Renders a purple box of size 47x11 starting at (110, 222).
; PLAN: r0=110(x), r1=222(y), r2=47(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 222
LDI r2, 47
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
