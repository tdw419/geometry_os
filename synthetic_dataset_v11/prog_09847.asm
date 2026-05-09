; DESCRIPTION: Renders a black line between points (103, 123) and (150, 20).
; PLAN: r0=103(x1), r1=123(y1), r2=150(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 123
LDI r2, 150
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
