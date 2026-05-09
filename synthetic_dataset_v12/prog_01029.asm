; DESCRIPTION: Composite: Renders a white line between points (465, 140) and (340, 249) then Places a cyan 12x84 rectangle at position (361, 83) then Creates a magenta circular shape at (429, 73) with radius 28.
; PLAN: r0=465(x1), r1=140(y1), r2=340(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=83(y), r7=12(width), r8=84(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=429(x), r11=73(y), r12=28(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 465
LDI r1, 140
LDI r2, 340
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 83
LDI r7, 12
LDI r8, 84
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 73
LDI r12, 28
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
