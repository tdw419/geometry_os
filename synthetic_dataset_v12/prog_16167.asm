; DESCRIPTION: Draws a orange rectangle at (406, 117) with width 93 and height 104.
; PLAN: r0=406(x), r1=117(y), r2=93(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 117
LDI r2, 93
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
