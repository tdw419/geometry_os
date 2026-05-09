; DESCRIPTION: Renders a red line between points (5, 99) and (386, 220).
; PLAN: r0=5(x1), r1=99(y1), r2=386(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 99
LDI r2, 386
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
