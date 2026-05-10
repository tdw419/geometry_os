; DESCRIPTION: Draws a orange rectangle at (230, 80) with width 91 and height 24.
; PLAN: r0=230(x), r1=80(y), r2=91(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 80
LDI r2, 91
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
