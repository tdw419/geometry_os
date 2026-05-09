; DESCRIPTION: Draws a yellow rectangle at (428, 57) with width 28 and height 30.
; PLAN: r0=428(x), r1=57(y), r2=28(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 57
LDI r2, 28
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
