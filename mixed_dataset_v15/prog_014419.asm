; DESCRIPTION: Composite: Places a black line segment connecting (40, 160) to (145, 63) then Renders a purple box of size 26x111 starting at (304, 54) then Places a black dot at position (210, 222).
; PLAN: r0=40(x1), r1=160(y1), r2=145(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=54(y), r7=26(width), r8=111(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x), r11=222(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 40
LDI r1, 160
LDI r2, 145
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 54
LDI r7, 26
LDI r8, 111
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 222
LDI r12, 0x000000
PSET r10, r11, r12
HALT
