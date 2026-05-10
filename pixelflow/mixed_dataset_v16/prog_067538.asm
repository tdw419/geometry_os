; DESCRIPTION: Composite: Places a magenta line segment connecting (245, 21) to (462, 149) then Places a magenta 71x78 rectangle at position (229, 106) then Sets a single white pixel at (281, 235).
; PLAN: r0=245(x1), r1=21(y1), r2=462(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=106(y), r7=71(width), r8=78(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x), r11=235(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 21
LDI r2, 462
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 106
LDI r7, 71
LDI r8, 78
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 235
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
