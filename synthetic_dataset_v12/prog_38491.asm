; DESCRIPTION: Composite: Draws a black rectangle at (422, 20) with width 17 and height 67 then Renders a white line between points (404, 11) and (183, 116).
; PLAN: r0=422(x), r1=20(y), r2=17(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x1), r6=11(y1), r7=183(x2), r8=116(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 20
LDI r2, 17
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 11
LDI r7, 183
LDI r8, 116
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
