; DESCRIPTION: Composite: . Then Renders a black disk with center (112, 183) and radius 59. Then Draws a cyan line from (144, 0) to (65, 92).
; PLAN: r0=112(x), r1=183(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=144(x1), r1=0(y1), r2=65(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (112, 183) and radius 59.
; PLAN: r0=112(x), r1=183(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 183
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (144, 0) to (65, 92).
; PLAN: r0=144(x1), r1=0(y1), r2=65(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 0
LDI r2, 65
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
