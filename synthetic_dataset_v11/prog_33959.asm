; DESCRIPTION: Renders a white line between points (229, 179) and (27, 191).
; PLAN: r0=229(x1), r1=179(y1), r2=27(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 179
LDI r2, 27
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
