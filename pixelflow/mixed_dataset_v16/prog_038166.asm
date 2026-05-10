; DESCRIPTION: Renders a red line between points (115, 220) and (364, 12).
; PLAN: r0=115(x1), r1=220(y1), r2=364(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 220
LDI r2, 364
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
