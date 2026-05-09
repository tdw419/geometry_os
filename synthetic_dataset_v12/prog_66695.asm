; DESCRIPTION: Renders a black box of size 99x85 starting at (220, 35).
; PLAN: r0=220(x), r1=35(y), r2=99(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 35
LDI r2, 99
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
