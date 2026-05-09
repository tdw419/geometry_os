; DESCRIPTION: Composite: Places a magenta 13x89 rectangle at position (144, 32) then Renders a magenta line between points (429, 16) and (436, 62) then Places a green circle of radius 28 at center (481, 207).
; PLAN: r0=144(x), r1=32(y), r2=13(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x1), r6=16(y1), r7=436(x2), r8=62(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=481(x), r11=207(y), r12=28(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 144
LDI r1, 32
LDI r2, 13
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 16
LDI r7, 436
LDI r8, 62
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 481
LDI r11, 207
LDI r12, 28
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
