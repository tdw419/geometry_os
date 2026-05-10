; DESCRIPTION: Composite: Sets a single orange pixel at (486, 167) then Draws a yellow line from (510, 8) to (33, 217) then Creates a cyan rectangular region at (387, 62) spanning 78 by 39 pixels.
; PLAN: r0=486(x), r1=167(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=510(x1), r6=8(y1), r7=33(x2), r8=217(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=387(x), r11=62(y), r12=78(width), r13=39(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 486
LDI r1, 167
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 510
LDI r6, 8
LDI r7, 33
LDI r8, 217
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 62
LDI r12, 78
LDI r13, 39
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
