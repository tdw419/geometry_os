; DESCRIPTION: Renders a white line between points (220, 214) and (12, 34).
; PLAN: r0=220(x1), r1=214(y1), r2=12(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 214
LDI r2, 12
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
