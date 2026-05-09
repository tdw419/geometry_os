; DESCRIPTION: Renders a white line between points (217, 48) and (191, 6).
; PLAN: r0=217(x1), r1=48(y1), r2=191(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 48
LDI r2, 191
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
