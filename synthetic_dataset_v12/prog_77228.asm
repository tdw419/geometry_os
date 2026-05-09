; DESCRIPTION: Draws a green line from (346, 227) to (186, 229).
; PLAN: r0=346(x1), r1=227(y1), r2=186(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 227
LDI r2, 186
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
