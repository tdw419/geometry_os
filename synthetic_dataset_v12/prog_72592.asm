; DESCRIPTION: Composite: Draws a cyan circle centered at (397, 66) with radius 25 then Renders a red line between points (58, 105) and (15, 133).
; PLAN: r0=397(x), r1=66(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x1), r6=105(y1), r7=15(x2), r8=133(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 66
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 105
LDI r7, 15
LDI r8, 133
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
