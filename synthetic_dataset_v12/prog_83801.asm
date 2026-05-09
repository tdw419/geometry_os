; DESCRIPTION: Composite: Places a red line segment connecting (240, 241) to (361, 238) then Draws a red rectangle at (282, 55) with width 71 and height 60.
; PLAN: r0=240(x1), r1=241(y1), r2=361(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=55(y), r7=71(width), r8=60(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 241
LDI r2, 361
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 55
LDI r7, 71
LDI r8, 60
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
