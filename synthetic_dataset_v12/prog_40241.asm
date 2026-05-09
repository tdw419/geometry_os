; DESCRIPTION: Composite: Places a black dot at position (11, 2) then Draws a magenta line from (87, 26) to (424, 252) then Places a white circle of radius 11 at center (320, 57).
; PLAN: r0=11(x), r1=2(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=87(x1), r6=26(y1), r7=424(x2), r8=252(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=57(y), r12=11(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 11
LDI r1, 2
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 87
LDI r6, 26
LDI r7, 424
LDI r8, 252
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 57
LDI r12, 11
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
