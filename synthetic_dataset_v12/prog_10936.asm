; DESCRIPTION: Draws a yellow rectangle at (238, 153) with width 104 and height 79.
; PLAN: r0=238(x), r1=153(y), r2=104(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 153
LDI r2, 104
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
