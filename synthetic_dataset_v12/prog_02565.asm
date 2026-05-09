; DESCRIPTION: Composite: Draws a blue rectangle at (82, 0) with width 21 and height 75 then Places a blue line segment connecting (382, 231) to (232, 44) then Sets a single magenta pixel at (155, 56).
; PLAN: r0=82(x), r1=0(y), r2=21(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x1), r6=231(y1), r7=232(x2), r8=44(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=56(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 0
LDI r2, 21
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 231
LDI r7, 232
LDI r8, 44
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 56
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
