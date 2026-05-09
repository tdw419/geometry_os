; DESCRIPTION: Places a cyan line segment connecting (291, 214) to (137, 155).
; PLAN: r0=291(x1), r1=214(y1), r2=137(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 214
LDI r2, 137
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
