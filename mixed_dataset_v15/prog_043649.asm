; DESCRIPTION: Composite: Sets a single yellow pixel at (3, 244) then Draws a yellow line from (176, 128) to (460, 206) then Draws a cyan rectangle at (127, 185) with width 23 and height 40.
; PLAN: r0=3(x), r1=244(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=176(x1), r6=128(y1), r7=460(x2), r8=206(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=127(x), r11=185(y), r12=23(width), r13=40(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 3
LDI r1, 244
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 176
LDI r6, 128
LDI r7, 460
LDI r8, 206
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 185
LDI r12, 23
LDI r13, 40
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
