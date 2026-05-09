; DESCRIPTION: Composite: Places a black dot at position (417, 102) then Renders a magenta line between points (2, 201) and (102, 237) then Draws a cyan rectangle at (380, 58) with width 64 and height 24.
; PLAN: r0=417(x), r1=102(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=2(x1), r6=201(y1), r7=102(x2), r8=237(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=58(y), r12=64(width), r13=24(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 102
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 2
LDI r6, 201
LDI r7, 102
LDI r8, 237
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 58
LDI r12, 64
LDI r13, 24
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
