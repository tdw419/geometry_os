; DESCRIPTION: Composite: Places a red line segment connecting (67, 179) to (359, 111) then Renders a yellow disk with center (116, 166) and radius 71.
; PLAN: r0=67(x1), r1=179(y1), r2=359(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=166(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 67
LDI r1, 179
LDI r2, 359
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 166
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
