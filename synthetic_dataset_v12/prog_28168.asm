; DESCRIPTION: Composite: Places a white line segment connecting (214, 171) to (292, 121) then Draws a black rectangle at (422, 81) with width 31 and height 80.
; PLAN: r0=214(x1), r1=171(y1), r2=292(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=81(y), r7=31(width), r8=80(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 171
LDI r2, 292
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 81
LDI r7, 31
LDI r8, 80
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
