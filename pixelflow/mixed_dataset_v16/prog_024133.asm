; DESCRIPTION: Renders a green line between points (450, 162) and (348, 36).
; PLAN: r0=450(x1), r1=162(y1), r2=348(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 162
LDI r2, 348
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
