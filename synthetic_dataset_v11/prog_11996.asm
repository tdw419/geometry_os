; DESCRIPTION: Renders a white line between points (123, 14) and (172, 164).
; PLAN: r0=123(x1), r1=14(y1), r2=172(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 14
LDI r2, 172
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
