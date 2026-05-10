; DESCRIPTION: Composite: Places a purple dot at position (17, 213) then Draws a magenta line from (284, 78) to (68, 115) then Places a yellow 80x23 rectangle at position (113, 101).
; PLAN: r0=17(x), r1=213(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=284(x1), r6=78(y1), r7=68(x2), r8=115(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=113(x), r11=101(y), r12=80(width), r13=23(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 17
LDI r1, 213
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 284
LDI r6, 78
LDI r7, 68
LDI r8, 115
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 101
LDI r12, 80
LDI r13, 23
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
