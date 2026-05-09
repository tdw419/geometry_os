; DESCRIPTION: Renders a green line between points (90, 154) and (432, 10).
; PLAN: r0=90(x1), r1=154(y1), r2=432(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 154
LDI r2, 432
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
