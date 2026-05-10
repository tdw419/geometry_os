; DESCRIPTION: Composite: Places a yellow dot at position (136, 231) then Creates a orange rectangular region at (194, 59) spanning 103 by 34 pixels then Places a cyan line segment connecting (422, 84) to (405, 188).
; PLAN: r0=136(x), r1=231(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=59(y), r7=103(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x1), r11=84(y1), r12=405(x2), r13=188(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 231
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 194
LDI r6, 59
LDI r7, 103
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 84
LDI r12, 405
LDI r13, 188
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
