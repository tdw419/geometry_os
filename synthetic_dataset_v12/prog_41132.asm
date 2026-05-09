; DESCRIPTION: Renders a white line between points (7, 171) and (444, 114).
; PLAN: r0=7(x1), r1=171(y1), r2=444(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 171
LDI r2, 444
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
