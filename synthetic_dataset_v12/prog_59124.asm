; DESCRIPTION: Renders a white line between points (303, 214) and (468, 115).
; PLAN: r0=303(x1), r1=214(y1), r2=468(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 214
LDI r2, 468
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
