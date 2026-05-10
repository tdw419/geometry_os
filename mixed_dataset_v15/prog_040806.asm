; DESCRIPTION: Draws a green rectangle at (154, 5) with width 104 and height 23.
; PLAN: r0=154(x), r1=5(y), r2=104(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 5
LDI r2, 104
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
