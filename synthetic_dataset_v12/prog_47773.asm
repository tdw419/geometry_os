; DESCRIPTION: Composite: Places a purple dot at position (201, 173) then Draws a cyan rectangle at (401, 232) with width 58 and height 21 then Renders a cyan line between points (444, 245) and (490, 34).
; PLAN: r0=201(x), r1=173(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=232(y), r7=58(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=444(x1), r11=245(y1), r12=490(x2), r13=34(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 201
LDI r1, 173
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 401
LDI r6, 232
LDI r7, 58
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 245
LDI r12, 490
LDI r13, 34
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
