; DESCRIPTION: Composite: Renders a magenta disk with center (372, 126) and radius 47 then Places a red line segment connecting (181, 26) to (126, 89).
; PLAN: r0=372(x), r1=126(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x1), r6=26(y1), r7=126(x2), r8=89(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 126
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 26
LDI r7, 126
LDI r8, 89
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
