; DESCRIPTION: Draws a red line from (207, 130) to (60, 129).
; PLAN: r0=207(x1), r1=130(y1), r2=60(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 130
LDI r2, 60
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
