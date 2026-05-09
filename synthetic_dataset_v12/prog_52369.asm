; DESCRIPTION: Draws a yellow line from (139, 46) to (38, 152).
; PLAN: r0=139(x1), r1=46(y1), r2=38(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 46
LDI r2, 38
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
