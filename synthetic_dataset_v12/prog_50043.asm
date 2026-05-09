; DESCRIPTION: Draws a orange rectangle at (220, 13) with width 47 and height 14.
; PLAN: r0=220(x), r1=13(y), r2=47(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 13
LDI r2, 47
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
