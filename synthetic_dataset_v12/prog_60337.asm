; DESCRIPTION: Draws a black line from (455, 176) to (254, 184).
; PLAN: r0=455(x1), r1=176(y1), r2=254(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 176
LDI r2, 254
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
