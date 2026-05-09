; DESCRIPTION: Renders a white line between points (466, 40) and (170, 150).
; PLAN: r0=466(x1), r1=40(y1), r2=170(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 40
LDI r2, 170
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
