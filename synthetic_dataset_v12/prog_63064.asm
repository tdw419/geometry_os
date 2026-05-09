; DESCRIPTION: Composite: Places a green circle of radius 50 at center (59, 138) then Places a red 52x61 rectangle at position (24, 62) then Draws a magenta line from (278, 246) to (5, 44).
; PLAN: r0=59(x), r1=138(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=62(y), r7=52(width), r8=61(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=278(x1), r11=246(y1), r12=5(x2), r13=44(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 138
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 62
LDI r7, 52
LDI r8, 61
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 278
LDI r11, 246
LDI r12, 5
LDI r13, 44
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
