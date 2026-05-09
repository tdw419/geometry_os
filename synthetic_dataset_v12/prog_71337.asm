; DESCRIPTION: Composite: Draws a black line from (417, 207) to (267, 155) then Renders a cyan box of size 62x68 starting at (103, 33) then Places a orange dot at position (89, 178).
; PLAN: r0=417(x1), r1=207(y1), r2=267(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=33(y), r7=62(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=89(x), r11=178(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 417
LDI r1, 207
LDI r2, 267
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 33
LDI r7, 62
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 178
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
