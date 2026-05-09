; DESCRIPTION: Draws a black rectangle at (428, 33) with width 80 and height 38.
; PLAN: r0=428(x), r1=33(y), r2=80(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 33
LDI r2, 80
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
