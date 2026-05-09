; DESCRIPTION: Composite: Draws a red line from (73, 209) to (373, 151) then Renders a yellow disk with center (406, 54) and radius 43.
; PLAN: r0=73(x1), r1=209(y1), r2=373(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=54(y), r7=43(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 73
LDI r1, 209
LDI r2, 373
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 54
LDI r7, 43
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
