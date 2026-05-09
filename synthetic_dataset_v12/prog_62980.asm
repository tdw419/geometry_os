; DESCRIPTION: Draws a red line from (241, 130) to (22, 15).
; PLAN: r0=241(x1), r1=130(y1), r2=22(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 130
LDI r2, 22
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
