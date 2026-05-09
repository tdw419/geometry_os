; DESCRIPTION: Renders a white line between points (153, 162) and (368, 30).
; PLAN: r0=153(x1), r1=162(y1), r2=368(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 162
LDI r2, 368
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
