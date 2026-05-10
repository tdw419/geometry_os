; DESCRIPTION: Composite: Places a green dot at position (235, 85) then Renders a magenta line between points (281, 15) and (295, 251) then Creates a orange circular shape at (188, 204) with radius 33.
; PLAN: r0=235(x), r1=85(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=281(x1), r6=15(y1), r7=295(x2), r8=251(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=188(x), r11=204(y), r12=33(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 235
LDI r1, 85
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 281
LDI r6, 15
LDI r7, 295
LDI r8, 251
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 204
LDI r12, 33
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
