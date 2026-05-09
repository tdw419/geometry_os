; DESCRIPTION: Composite: Renders a black line between points (250, 207) and (273, 110) then Renders a magenta box of size 98x32 starting at (206, 141) then Places a cyan circle of radius 63 at center (141, 97).
; PLAN: r0=250(x1), r1=207(y1), r2=273(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=141(y), r7=98(width), r8=32(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=141(x), r11=97(y), r12=63(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 250
LDI r1, 207
LDI r2, 273
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 141
LDI r7, 98
LDI r8, 32
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 97
LDI r12, 63
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
