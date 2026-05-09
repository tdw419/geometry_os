; DESCRIPTION: Draws a white line from (172, 243) to (191, 5).
; PLAN: r0=172(x1), r1=243(y1), r2=191(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 243
LDI r2, 191
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
