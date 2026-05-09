; DESCRIPTION: Composite: Places a white circle of radius 67 at center (241, 117) then Draws a red rectangle at (283, 133) with width 117 and height 46 then Draws a green line from (228, 31) to (309, 123).
; PLAN: r0=241(x), r1=117(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=133(y), r7=117(width), r8=46(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=228(x1), r11=31(y1), r12=309(x2), r13=123(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 117
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 133
LDI r7, 117
LDI r8, 46
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 31
LDI r12, 309
LDI r13, 123
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
