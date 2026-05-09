; DESCRIPTION: Composite: Draws a cyan circle centered at (264, 160) with radius 49 then Renders a cyan line between points (18, 0) and (440, 71).
; PLAN: r0=264(x), r1=160(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x1), r6=0(y1), r7=440(x2), r8=71(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 160
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 0
LDI r7, 440
LDI r8, 71
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
