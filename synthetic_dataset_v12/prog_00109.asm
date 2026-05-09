; DESCRIPTION: Renders a white line between points (120, 58) and (475, 15).
; PLAN: r0=120(x1), r1=58(y1), r2=475(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 58
LDI r2, 475
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
