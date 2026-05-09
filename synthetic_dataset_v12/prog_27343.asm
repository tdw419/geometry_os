; DESCRIPTION: Composite: Sets a single white pixel at (454, 127) then Draws a blue line from (468, 35) to (258, 154) then Draws a cyan rectangle at (349, 24) with width 22 and height 70.
; PLAN: r0=454(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=468(x1), r6=35(y1), r7=258(x2), r8=154(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=349(x), r11=24(y), r12=22(width), r13=70(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 468
LDI r6, 35
LDI r7, 258
LDI r8, 154
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 349
LDI r11, 24
LDI r12, 22
LDI r13, 70
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
