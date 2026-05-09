; DESCRIPTION: Composite: . Then Draws a purple rectangle at (59, 55) with width 91 and height 104. Then Renders a blue line between points (102, 153) and (157, 139).
; PLAN: r0=59(x), r1=55(y), r2=91(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=102(x1), r1=153(y1), r2=157(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple rectangle at (59, 55) with width 91 and height 104.
; PLAN: r0=59(x), r1=55(y), r2=91(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 55
LDI r2, 91
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (102, 153) and (157, 139).
; PLAN: r0=102(x1), r1=153(y1), r2=157(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 153
LDI r2, 157
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
