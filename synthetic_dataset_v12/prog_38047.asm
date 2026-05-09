; DESCRIPTION: Composite: Places a green circle of radius 20 at center (156, 159) then Places a red line segment connecting (214, 88) to (66, 47).
; PLAN: r0=156(x), r1=159(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x1), r6=88(y1), r7=66(x2), r8=47(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 159
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 88
LDI r7, 66
LDI r8, 47
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
