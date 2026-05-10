; DESCRIPTION: Composite: Sets a single purple pixel at (122, 20) then Draws a green line from (305, 26) to (169, 183) then Places a blue 13x97 rectangle at position (456, 105).
; PLAN: r0=122(x), r1=20(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=305(x1), r6=26(y1), r7=169(x2), r8=183(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=456(x), r11=105(y), r12=13(width), r13=97(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 20
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 26
LDI r7, 169
LDI r8, 183
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 105
LDI r12, 13
LDI r13, 97
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
