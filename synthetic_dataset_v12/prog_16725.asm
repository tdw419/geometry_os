; DESCRIPTION: Renders a cyan line between points (407, 148) and (170, 211).
; PLAN: r0=407(x1), r1=148(y1), r2=170(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 148
LDI r2, 170
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
