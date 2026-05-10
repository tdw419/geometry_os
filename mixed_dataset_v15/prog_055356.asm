; DESCRIPTION: Draws a black line from (254, 231) to (411, 59).
; PLAN: r0=254(x1), r1=231(y1), r2=411(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 231
LDI r2, 411
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
