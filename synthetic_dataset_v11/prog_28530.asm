; DESCRIPTION: Composite: . Then Draws a black rectangle at (104, 45) with width 83 and height 59. Then Draws a red line from (1, 247) to (249, 22).
; PLAN: r0=104(x), r1=45(y), r2=83(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=1(x1), r1=247(y1), r2=249(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black rectangle at (104, 45) with width 83 and height 59.
; PLAN: r0=104(x), r1=45(y), r2=83(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 45
LDI r2, 83
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red line from (1, 247) to (249, 22).
; PLAN: r0=1(x1), r1=247(y1), r2=249(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 247
LDI r2, 249
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
