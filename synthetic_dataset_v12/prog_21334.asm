; DESCRIPTION: Composite: Draws a purple rectangle at (117, 95) with width 73 and height 111 then Places a green line segment connecting (350, 45) to (403, 175).
; PLAN: r0=117(x), r1=95(y), r2=73(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x1), r6=45(y1), r7=403(x2), r8=175(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 95
LDI r2, 73
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 45
LDI r7, 403
LDI r8, 175
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
