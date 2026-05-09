; DESCRIPTION: Draws a orange rectangle at (215, 118) with width 21 and height 47.
; PLAN: r0=215(x), r1=118(y), r2=21(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 118
LDI r2, 21
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
