; DESCRIPTION: Draws a orange rectangle at (164, 8) with width 118 and height 64.
; PLAN: r0=164(x), r1=8(y), r2=118(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 8
LDI r2, 118
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
