; DESCRIPTION: Draws a orange rectangle at (121, 50) with width 36 and height 104.
; PLAN: r0=121(x), r1=50(y), r2=36(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 50
LDI r2, 36
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
