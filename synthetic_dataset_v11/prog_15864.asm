; DESCRIPTION: Draws a cyan rectangle at (130, 114) with width 99 and height 116.
; PLAN: r0=130(x), r1=114(y), r2=99(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 114
LDI r2, 99
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
