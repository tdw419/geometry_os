; DESCRIPTION: Renders a white line between points (251, 215) and (433, 123).
; PLAN: r0=251(x1), r1=215(y1), r2=433(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 215
LDI r2, 433
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
