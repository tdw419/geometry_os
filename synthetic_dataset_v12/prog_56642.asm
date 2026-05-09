; DESCRIPTION: Composite: Creates a orange circular shape at (85, 130) with radius 72 then Places a red line segment connecting (417, 168) to (265, 101) then Places a red dot at position (44, 97).
; PLAN: r0=85(x), r1=130(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x1), r6=168(y1), r7=265(x2), r8=101(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=44(x), r11=97(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 85
LDI r1, 130
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 168
LDI r7, 265
LDI r8, 101
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 44
LDI r11, 97
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
