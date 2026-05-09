; DESCRIPTION: Composite: Creates a orange circular shape at (175, 98) with radius 64 then Renders a magenta line between points (116, 119) and (270, 115).
; PLAN: r0=175(x), r1=98(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x1), r6=119(y1), r7=270(x2), r8=115(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 98
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 119
LDI r7, 270
LDI r8, 115
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
