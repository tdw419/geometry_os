; DESCRIPTION: Composite: Places a cyan 98x82 rectangle at position (116, 103) then Creates a orange circular shape at (265, 110) with radius 36 then Places a green line segment connecting (501, 124) to (198, 139).
; PLAN: r0=116(x), r1=103(y), r2=98(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=265(x), r6=110(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=501(x1), r11=124(y1), r12=198(x2), r13=139(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 103
LDI r2, 98
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 110
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 501
LDI r11, 124
LDI r12, 198
LDI r13, 139
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
