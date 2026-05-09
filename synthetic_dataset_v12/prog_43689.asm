; DESCRIPTION: Composite: Draws a white rectangle at (356, 17) with width 82 and height 59 then Draws a yellow line from (375, 112) to (500, 187).
; PLAN: r0=356(x), r1=17(y), r2=82(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x1), r6=112(y1), r7=500(x2), r8=187(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 17
LDI r2, 82
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 112
LDI r7, 500
LDI r8, 187
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
