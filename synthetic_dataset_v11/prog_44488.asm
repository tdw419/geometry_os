; DESCRIPTION: Draws a yellow line from (22, 226) to (244, 242).
; PLAN: r0=22(x1), r1=226(y1), r2=244(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 226
LDI r2, 244
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
