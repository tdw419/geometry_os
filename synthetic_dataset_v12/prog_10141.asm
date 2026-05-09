; DESCRIPTION: Composite: Places a white dot at position (329, 230) then Draws a cyan line from (81, 0) to (390, 172) then Creates a red rectangular region at (371, 135) spanning 12 by 36 pixels.
; PLAN: r0=329(x), r1=230(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=81(x1), r6=0(y1), r7=390(x2), r8=172(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=371(x), r11=135(y), r12=12(width), r13=36(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 230
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 0
LDI r7, 390
LDI r8, 172
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 135
LDI r12, 12
LDI r13, 36
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
