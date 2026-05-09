; DESCRIPTION: Composite: Creates a orange circular shape at (243, 147) with radius 77 then Draws a red line from (45, 128) to (128, 134) then Places a green dot at position (54, 250).
; PLAN: r0=243(x), r1=147(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x1), r6=128(y1), r7=128(x2), r8=134(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=250(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 243
LDI r1, 147
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 128
LDI r7, 128
LDI r8, 134
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 250
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
