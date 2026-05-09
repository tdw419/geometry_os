; DESCRIPTION: Composite: Places a cyan dot at position (505, 242) then Places a yellow 64x22 rectangle at position (388, 105) then Places a orange line segment connecting (422, 178) to (71, 122).
; PLAN: r0=505(x), r1=242(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=105(y), r7=64(width), r8=22(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x1), r11=178(y1), r12=71(x2), r13=122(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 505
LDI r1, 242
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 105
LDI r7, 64
LDI r8, 22
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 178
LDI r12, 71
LDI r13, 122
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
