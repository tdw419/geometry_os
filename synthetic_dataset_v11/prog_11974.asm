; DESCRIPTION: Draws a white line from (246, 229) to (208, 221).
; PLAN: r0=246(x1), r1=229(y1), r2=208(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 229
LDI r2, 208
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
