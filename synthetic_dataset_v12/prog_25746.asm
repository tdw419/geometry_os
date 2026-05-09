; DESCRIPTION: Draws a green line from (336, 65) to (135, 200).
; PLAN: r0=336(x1), r1=65(y1), r2=135(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 65
LDI r2, 135
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
