; DESCRIPTION: Renders a white line between points (312, 10) and (150, 127).
; PLAN: r0=312(x1), r1=10(y1), r2=150(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 10
LDI r2, 150
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
