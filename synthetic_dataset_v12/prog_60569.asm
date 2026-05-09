; DESCRIPTION: Composite: Renders a black disk with center (100, 159) and radius 39 then Places a red line segment connecting (209, 116) to (357, 76).
; PLAN: r0=100(x), r1=159(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x1), r6=116(y1), r7=357(x2), r8=76(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 159
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 116
LDI r7, 357
LDI r8, 76
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
