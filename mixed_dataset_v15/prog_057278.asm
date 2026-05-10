; DESCRIPTION: Composite: Creates a purple rectangular region at (340, 163) spanning 11 by 59 pixels then Places a blue line segment connecting (442, 24) to (57, 19).
; PLAN: r0=340(x), r1=163(y), r2=11(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x1), r6=24(y1), r7=57(x2), r8=19(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 163
LDI r2, 11
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 24
LDI r7, 57
LDI r8, 19
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
