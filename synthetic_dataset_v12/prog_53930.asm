; DESCRIPTION: Draws a black rectangle at (370, 46) with width 16 and height 14.
; PLAN: r0=370(x), r1=46(y), r2=16(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 46
LDI r2, 16
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
