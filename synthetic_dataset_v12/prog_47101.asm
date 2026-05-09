; DESCRIPTION: Renders a yellow line between points (187, 10) and (52, 120).
; PLAN: r0=187(x1), r1=10(y1), r2=52(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 10
LDI r2, 52
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
