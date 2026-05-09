; DESCRIPTION: Draws a black rectangle at (445, 35) with width 22 and height 16.
; PLAN: r0=445(x), r1=35(y), r2=22(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 35
LDI r2, 22
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
