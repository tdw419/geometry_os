; DESCRIPTION: Renders a white line between points (229, 147) and (113, 207).
; PLAN: r0=229(x1), r1=147(y1), r2=113(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 147
LDI r2, 113
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
