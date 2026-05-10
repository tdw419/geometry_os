; DESCRIPTION: Composite: Draws a yellow rectangle at (246, 116) with width 103 and height 104 then Places a green dot at position (144, 82) then Renders a magenta line between points (57, 134) and (90, 21).
; PLAN: r0=246(x), r1=116(y), r2=103(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=82(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=57(x1), r11=134(y1), r12=90(x2), r13=21(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 116
LDI r2, 103
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 82
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 57
LDI r11, 134
LDI r12, 90
LDI r13, 21
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
