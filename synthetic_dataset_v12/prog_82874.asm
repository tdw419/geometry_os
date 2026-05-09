; DESCRIPTION: Composite: Places a purple line segment connecting (437, 55) to (345, 204) then Draws a cyan rectangle at (201, 46) with width 40 and height 61 then Sets a single blue pixel at (509, 178).
; PLAN: r0=437(x1), r1=55(y1), r2=345(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=46(y), r7=40(width), r8=61(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=509(x), r11=178(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 437
LDI r1, 55
LDI r2, 345
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 46
LDI r7, 40
LDI r8, 61
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 509
LDI r11, 178
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
