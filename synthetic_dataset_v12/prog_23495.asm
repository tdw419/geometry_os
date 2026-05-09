; DESCRIPTION: Draws a green line from (104, 181) to (186, 96).
; PLAN: r0=104(x1), r1=181(y1), r2=186(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 181
LDI r2, 186
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
