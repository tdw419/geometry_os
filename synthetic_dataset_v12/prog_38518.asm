; DESCRIPTION: Composite: Sets a single black pixel at (257, 154) then Renders a yellow box of size 38x54 starting at (257, 13) then Draws a yellow line from (146, 49) to (185, 234).
; PLAN: r0=257(x), r1=154(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=13(y), r7=38(width), r8=54(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=146(x1), r11=49(y1), r12=185(x2), r13=234(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 154
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 257
LDI r6, 13
LDI r7, 38
LDI r8, 54
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 49
LDI r12, 185
LDI r13, 234
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
