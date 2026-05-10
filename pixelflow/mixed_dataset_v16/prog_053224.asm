; DESCRIPTION: Composite: Places a orange circle of radius 42 at center (280, 75) then Draws a blue line from (71, 53) to (259, 249) then Places a green dot at position (278, 231).
; PLAN: r0=280(x), r1=75(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x1), r6=53(y1), r7=259(x2), r8=249(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=278(x), r11=231(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 280
LDI r1, 75
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 53
LDI r7, 259
LDI r8, 249
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 231
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
