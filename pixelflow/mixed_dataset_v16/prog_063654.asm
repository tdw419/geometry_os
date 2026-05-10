; DESCRIPTION: Composite: Renders a purple line between points (353, 13) and (278, 171) then Draws a black rectangle at (199, 163) with width 111 and height 61.
; PLAN: r0=353(x1), r1=13(y1), r2=278(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=163(y), r7=111(width), r8=61(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 13
LDI r2, 278
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 163
LDI r7, 111
LDI r8, 61
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
