; DESCRIPTION: Renders a green box of size 17x35 starting at (470, 25).
; PLAN: r0=470(x), r1=25(y), r2=17(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 25
LDI r2, 17
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
