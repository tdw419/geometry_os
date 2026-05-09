; DESCRIPTION: Places a black line segment connecting (161, 157) to (188, 166).
; PLAN: r0=161(x1), r1=157(y1), r2=188(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 157
LDI r2, 188
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
