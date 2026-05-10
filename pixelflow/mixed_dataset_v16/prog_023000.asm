; DESCRIPTION: Composite: Places a yellow dot at position (249, 24) then Places a white 66x17 rectangle at position (272, 196) then Draws a orange circle centered at (398, 174) with radius 52.
; PLAN: r0=249(x), r1=24(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=272(x), r6=196(y), r7=66(width), r8=17(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=398(x), r11=174(y), r12=52(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 24
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 272
LDI r6, 196
LDI r7, 66
LDI r8, 17
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 174
LDI r12, 52
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
