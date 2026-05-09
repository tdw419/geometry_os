; DESCRIPTION: Draws a yellow line from (244, 168) to (254, 98).
; PLAN: r0=244(x1), r1=168(y1), r2=254(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 168
LDI r2, 254
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
