; DESCRIPTION: Draws a black line from (502, 160) to (62, 149).
; PLAN: r0=502(x1), r1=160(y1), r2=62(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 160
LDI r2, 62
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
