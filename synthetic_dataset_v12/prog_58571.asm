; DESCRIPTION: Renders a green line between points (132, 35) and (450, 120).
; PLAN: r0=132(x1), r1=35(y1), r2=450(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 35
LDI r2, 450
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
