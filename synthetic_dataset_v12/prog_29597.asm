; DESCRIPTION: Composite: Draws a white line from (15, 188) to (252, 227) then Places a green dot at position (294, 143) then Draws a cyan circle centered at (438, 207) with radius 42.
; PLAN: r0=15(x1), r1=188(y1), r2=252(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=143(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=438(x), r11=207(y), r12=42(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 15
LDI r1, 188
LDI r2, 252
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 143
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 438
LDI r11, 207
LDI r12, 42
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
