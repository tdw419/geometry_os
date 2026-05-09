; DESCRIPTION: Draws a orange rectangle at (229, 104) with width 93 and height 113.
; PLAN: r0=229(x), r1=104(y), r2=93(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 104
LDI r2, 93
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
