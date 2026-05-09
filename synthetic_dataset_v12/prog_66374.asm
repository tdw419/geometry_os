; DESCRIPTION: Draws a orange rectangle at (35, 215) with width 58 and height 13.
; PLAN: r0=35(x), r1=215(y), r2=58(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 215
LDI r2, 58
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
