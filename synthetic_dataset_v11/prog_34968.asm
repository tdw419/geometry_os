; DESCRIPTION: Draws a orange rectangle at (129, 144) with width 94 and height 16.
; PLAN: r0=129(x), r1=144(y), r2=94(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 144
LDI r2, 94
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
