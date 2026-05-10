; DESCRIPTION: Composite: Places a magenta dot at position (370, 215) then Draws a magenta rectangle at (334, 91) with width 16 and height 108 then Places a white line segment connecting (205, 210) to (321, 35).
; PLAN: r0=370(x), r1=215(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=91(y), r7=16(width), r8=108(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x1), r11=210(y1), r12=321(x2), r13=35(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 215
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 334
LDI r6, 91
LDI r7, 16
LDI r8, 108
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 210
LDI r12, 321
LDI r13, 35
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
