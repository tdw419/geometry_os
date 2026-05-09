; DESCRIPTION: Draws a black rectangle at (102, 68) with width 98 and height 16.
; PLAN: r0=102(x), r1=68(y), r2=98(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 68
LDI r2, 98
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
