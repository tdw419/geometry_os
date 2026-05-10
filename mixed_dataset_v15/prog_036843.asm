; DESCRIPTION: Composite: Renders a black disk with center (25, 44) and radius 20 then Renders a magenta line between points (261, 121) and (386, 10).
; PLAN: r0=25(x), r1=44(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x1), r6=121(y1), r7=386(x2), r8=10(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 44
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 121
LDI r7, 386
LDI r8, 10
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
