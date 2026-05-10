; DESCRIPTION: Composite: Places a white dot at position (183, 20) then Draws a green circle centered at (42, 129) with radius 36 then Places a orange line segment connecting (439, 236) to (296, 245).
; PLAN: r0=183(x), r1=20(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=129(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x1), r11=236(y1), r12=296(x2), r13=245(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 20
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 129
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 236
LDI r12, 296
LDI r13, 245
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
