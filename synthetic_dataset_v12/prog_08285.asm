; DESCRIPTION: Renders a red line between points (340, 186) and (319, 40).
; PLAN: r0=340(x1), r1=186(y1), r2=319(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 186
LDI r2, 319
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
