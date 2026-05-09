; DESCRIPTION: Renders a white line between points (188, 249) and (229, 174).
; PLAN: r0=188(x1), r1=249(y1), r2=229(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 249
LDI r2, 229
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
