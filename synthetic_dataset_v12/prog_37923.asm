; DESCRIPTION: Draws a orange rectangle at (164, 208) with width 20 and height 31.
; PLAN: r0=164(x), r1=208(y), r2=20(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 208
LDI r2, 20
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
