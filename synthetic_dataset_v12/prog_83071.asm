; DESCRIPTION: Renders a red line between points (144, 126) and (78, 107).
; PLAN: r0=144(x1), r1=126(y1), r2=78(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 126
LDI r2, 78
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
