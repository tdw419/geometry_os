; DESCRIPTION: Draws a orange rectangle at (482, 98) with width 30 and height 12.
; PLAN: r0=482(x), r1=98(y), r2=30(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 98
LDI r2, 30
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
