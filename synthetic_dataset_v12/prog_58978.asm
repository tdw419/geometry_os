; DESCRIPTION: Draws a orange rectangle at (256, 115) with width 94 and height 38.
; PLAN: r0=256(x), r1=115(y), r2=94(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 115
LDI r2, 94
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
