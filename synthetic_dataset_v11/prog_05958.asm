; DESCRIPTION: Renders a white line between points (220, 20) and (109, 95).
; PLAN: r0=220(x1), r1=20(y1), r2=109(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 20
LDI r2, 109
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
