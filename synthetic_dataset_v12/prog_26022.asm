; DESCRIPTION: Renders a black line between points (290, 98) and (344, 90).
; PLAN: r0=290(x1), r1=98(y1), r2=344(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 98
LDI r2, 344
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
