; DESCRIPTION: Composite: Places a cyan dot at position (133, 247) then Renders a black box of size 89x21 starting at (351, 156) then Draws a yellow circle centered at (450, 103) with radius 11.
; PLAN: r0=133(x), r1=247(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=156(y), r7=89(width), r8=21(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=450(x), r11=103(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 133
LDI r1, 247
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 351
LDI r6, 156
LDI r7, 89
LDI r8, 21
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 103
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
