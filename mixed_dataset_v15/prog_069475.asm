; DESCRIPTION: Composite: Places a magenta dot at position (353, 163) then Draws a cyan line from (261, 218) to (410, 104) then Draws a magenta circle centered at (307, 185) with radius 64.
; PLAN: r0=353(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=261(x1), r6=218(y1), r7=410(x2), r8=104(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=307(x), r11=185(y), r12=64(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 218
LDI r7, 410
LDI r8, 104
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 185
LDI r12, 64
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
