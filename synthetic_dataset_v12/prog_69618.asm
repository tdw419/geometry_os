; DESCRIPTION: Draws a cyan rectangle at (142, 26) with width 38 and height 114.
; PLAN: r0=142(x), r1=26(y), r2=38(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 26
LDI r2, 38
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
