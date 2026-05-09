; DESCRIPTION: Renders a white line between points (290, 212) and (129, 236).
; PLAN: r0=290(x1), r1=212(y1), r2=129(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 212
LDI r2, 129
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
