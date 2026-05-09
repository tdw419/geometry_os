; DESCRIPTION: Renders a white line between points (211, 122) and (121, 117).
; PLAN: r0=211(x1), r1=122(y1), r2=121(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 122
LDI r2, 121
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
