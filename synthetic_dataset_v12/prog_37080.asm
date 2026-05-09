; DESCRIPTION: Composite: Draws a cyan circle centered at (173, 159) with radius 48 then Renders a orange line between points (433, 60) and (177, 189).
; PLAN: r0=173(x), r1=159(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x1), r6=60(y1), r7=177(x2), r8=189(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 159
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 60
LDI r7, 177
LDI r8, 189
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
