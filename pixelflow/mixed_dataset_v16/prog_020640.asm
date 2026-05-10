; DESCRIPTION: Composite: Places a blue line segment connecting (452, 155) to (194, 215) then Creates a blue rectangular region at (482, 131) spanning 20 by 76 pixels.
; PLAN: r0=452(x1), r1=155(y1), r2=194(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=482(x), r6=131(y), r7=20(width), r8=76(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 155
LDI r2, 194
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 131
LDI r7, 20
LDI r8, 76
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
