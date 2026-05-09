; DESCRIPTION: Composite: Places a magenta 60x48 rectangle at position (417, 189) then Draws a purple circle centered at (304, 167) with radius 64 then Renders a magenta line between points (391, 93) and (145, 229).
; PLAN: r0=417(x), r1=189(y), r2=60(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=167(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x1), r11=93(y1), r12=145(x2), r13=229(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 189
LDI r2, 60
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 167
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 93
LDI r12, 145
LDI r13, 229
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
