; DESCRIPTION: Renders a white line between points (185, 249) and (303, 182).
; PLAN: r0=185(x1), r1=249(y1), r2=303(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 249
LDI r2, 303
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
