; DESCRIPTION: Draws a green rectangle at (428, 207) with width 43 and height 10.
; PLAN: r0=428(x), r1=207(y), r2=43(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 207
LDI r2, 43
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
