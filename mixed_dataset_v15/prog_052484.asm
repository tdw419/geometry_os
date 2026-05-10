; DESCRIPTION: Composite: Draws a red circle centered at (190, 142) with radius 45 then Renders a magenta line between points (385, 91) and (113, 21).
; PLAN: r0=190(x), r1=142(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x1), r6=91(y1), r7=113(x2), r8=21(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 142
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 91
LDI r7, 113
LDI r8, 21
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
