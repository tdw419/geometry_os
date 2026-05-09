; DESCRIPTION: Composite: Renders a black line between points (281, 42) and (393, 97) then Places a white 31x63 rectangle at position (27, 122) then Sets a single green pixel at (139, 102).
; PLAN: r0=281(x1), r1=42(y1), r2=393(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=27(x), r6=122(y), r7=31(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=139(x), r11=102(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 281
LDI r1, 42
LDI r2, 393
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 122
LDI r7, 31
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 102
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
