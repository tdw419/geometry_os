; DESCRIPTION: Composite: Places a cyan dot at position (294, 20) then Creates a magenta rectangular region at (376, 43) spanning 60 by 97 pixels then Draws a white line from (137, 192) to (264, 214).
; PLAN: r0=294(x), r1=20(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=43(y), r7=60(width), r8=97(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=137(x1), r11=192(y1), r12=264(x2), r13=214(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 20
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 43
LDI r7, 60
LDI r8, 97
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 192
LDI r12, 264
LDI r13, 214
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
