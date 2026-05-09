; DESCRIPTION: Renders a white line between points (237, 20) and (162, 126).
; PLAN: r0=237(x1), r1=20(y1), r2=162(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 20
LDI r2, 162
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
