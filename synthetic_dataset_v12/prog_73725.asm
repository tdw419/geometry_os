; DESCRIPTION: Composite: Sets a single cyan pixel at (458, 102) then Draws a white line from (236, 86) to (501, 196) then Places a cyan 45x88 rectangle at position (353, 100).
; PLAN: r0=458(x), r1=102(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=236(x1), r6=86(y1), r7=501(x2), r8=196(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=100(y), r12=45(width), r13=88(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 458
LDI r1, 102
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 86
LDI r7, 501
LDI r8, 196
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 100
LDI r12, 45
LDI r13, 88
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
