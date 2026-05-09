; DESCRIPTION: Renders a white line between points (306, 180) and (48, 36).
; PLAN: r0=306(x1), r1=180(y1), r2=48(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 180
LDI r2, 48
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
