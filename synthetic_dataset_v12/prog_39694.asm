; DESCRIPTION: Renders a white line between points (230, 145) and (281, 123).
; PLAN: r0=230(x1), r1=145(y1), r2=281(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 145
LDI r2, 281
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
