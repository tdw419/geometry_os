; DESCRIPTION: Composite: Creates a purple rectangular region at (390, 52) spanning 40 by 108 pixels then Draws a blue line from (443, 197) to (64, 160).
; PLAN: r0=390(x), r1=52(y), r2=40(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x1), r6=197(y1), r7=64(x2), r8=160(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 52
LDI r2, 40
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 197
LDI r7, 64
LDI r8, 160
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
