; DESCRIPTION: Composite: . Then Renders a orange disk with center (95, 165) and radius 31. Then Draws a purple line from (182, 0) to (28, 169).
; PLAN: r0=95(x), r1=165(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=182(x1), r1=0(y1), r2=28(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (95, 165) and radius 31.
; PLAN: r0=95(x), r1=165(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 165
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (182, 0) to (28, 169).
; PLAN: r0=182(x1), r1=0(y1), r2=28(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 0
LDI r2, 28
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
