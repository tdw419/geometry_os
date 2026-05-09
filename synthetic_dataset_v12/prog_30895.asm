; DESCRIPTION: Composite: Draws a white line from (88, 164) to (185, 250) then Creates a white rectangular region at (379, 206) spanning 49 by 21 pixels.
; PLAN: r0=88(x1), r1=164(y1), r2=185(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=206(y), r7=49(width), r8=21(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 164
LDI r2, 185
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 206
LDI r7, 49
LDI r8, 21
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
