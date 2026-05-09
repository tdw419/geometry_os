; DESCRIPTION: Draws a yellow line from (180, 117) to (244, 152).
; PLAN: r0=180(x1), r1=117(y1), r2=244(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 117
LDI r2, 244
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
