; DESCRIPTION: Draws a black rectangle at (410, 22) with width 55 and height 61.
; PLAN: r0=410(x), r1=22(y), r2=55(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 22
LDI r2, 55
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
