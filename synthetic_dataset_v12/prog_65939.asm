; DESCRIPTION: Composite: Places a cyan 81x30 rectangle at position (248, 6) then Places a white line segment connecting (304, 40) to (259, 67) then Places a orange dot at position (485, 178).
; PLAN: r0=248(x), r1=6(y), r2=81(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x1), r6=40(y1), r7=259(x2), r8=67(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=485(x), r11=178(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 6
LDI r2, 81
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 40
LDI r7, 259
LDI r8, 67
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 485
LDI r11, 178
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
