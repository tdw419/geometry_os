; DESCRIPTION: Renders a white line between points (33, 78) and (213, 148).
; PLAN: r0=33(x1), r1=78(y1), r2=213(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 78
LDI r2, 213
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
