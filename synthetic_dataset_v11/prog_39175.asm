; DESCRIPTION: Renders a blue box of size 110x65 starting at (9, 120).
; PLAN: r0=9(x), r1=120(y), r2=110(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 120
LDI r2, 110
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
