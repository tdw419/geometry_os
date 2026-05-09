; DESCRIPTION: Draws a blue rectangle at (303, 68) with width 16 and height 41.
; PLAN: r0=303(x), r1=68(y), r2=16(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 68
LDI r2, 16
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
