; DESCRIPTION: Draws a orange rectangle at (256, 148) with width 36 and height 104.
; PLAN: r0=256(x), r1=148(y), r2=36(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 148
LDI r2, 36
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
