; DESCRIPTION: Composite: Draws a red circle centered at (151, 150) with radius 31 then Renders a magenta line between points (39, 129) and (190, 200).
; PLAN: r0=151(x), r1=150(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x1), r6=129(y1), r7=190(x2), r8=200(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 150
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 129
LDI r7, 190
LDI r8, 200
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
