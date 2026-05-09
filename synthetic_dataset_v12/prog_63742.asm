; DESCRIPTION: Renders a white line between points (54, 74) and (209, 2).
; PLAN: r0=54(x1), r1=74(y1), r2=209(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 74
LDI r2, 209
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
