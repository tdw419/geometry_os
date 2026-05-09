; DESCRIPTION: Composite: Draws a orange rectangle at (390, 19) with width 39 and height 59 then Draws a white line from (325, 79) to (359, 210) then Places a orange dot at position (168, 165).
; PLAN: r0=390(x), r1=19(y), r2=39(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x1), r6=79(y1), r7=359(x2), r8=210(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=168(x), r11=165(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 19
LDI r2, 39
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 79
LDI r7, 359
LDI r8, 210
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 165
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
