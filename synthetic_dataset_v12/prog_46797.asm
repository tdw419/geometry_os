; DESCRIPTION: Composite: Draws a purple line from (360, 231) to (488, 134) then Places a orange 77x59 rectangle at position (357, 27) then Sets a single white pixel at (0, 62).
; PLAN: r0=360(x1), r1=231(y1), r2=488(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=357(x), r6=27(y), r7=77(width), r8=59(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=0(x), r11=62(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 360
LDI r1, 231
LDI r2, 488
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 27
LDI r7, 77
LDI r8, 59
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 0
LDI r11, 62
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
