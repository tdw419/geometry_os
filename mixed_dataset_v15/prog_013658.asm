; DESCRIPTION: Composite: Places a red 66x67 rectangle at position (156, 106) then Draws a red circle centered at (263, 60) with radius 52 then Renders a cyan line between points (40, 237) and (130, 154).
; PLAN: r0=156(x), r1=106(y), r2=66(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=60(y), r7=52(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x1), r11=237(y1), r12=130(x2), r13=154(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 106
LDI r2, 66
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 60
LDI r7, 52
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 237
LDI r12, 130
LDI r13, 154
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
