; DESCRIPTION: Composite: Sets a single blue pixel at (136, 113) then Draws a magenta line from (424, 228) to (129, 20) then Places a green 31x20 rectangle at position (268, 211).
; PLAN: r0=136(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=424(x1), r6=228(y1), r7=129(x2), r8=20(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=268(x), r11=211(y), r12=31(width), r13=20(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 113
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 424
LDI r6, 228
LDI r7, 129
LDI r8, 20
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 211
LDI r12, 31
LDI r13, 20
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
