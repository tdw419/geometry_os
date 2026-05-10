; DESCRIPTION: Draws a green rectangle at (206, 60) with width 104 and height 100.
; PLAN: r0=206(x), r1=60(y), r2=104(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 60
LDI r2, 104
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
