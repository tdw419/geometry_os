; DESCRIPTION: Composite: Creates a black rectangular region at (349, 171) spanning 110 by 67 pixels then Places a black line segment connecting (400, 54) to (497, 249).
; PLAN: r0=349(x), r1=171(y), r2=110(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=54(y1), r7=497(x2), r8=249(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 171
LDI r2, 110
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 54
LDI r7, 497
LDI r8, 249
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
