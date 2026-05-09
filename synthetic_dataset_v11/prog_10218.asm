; DESCRIPTION: Draws a cyan rectangle at (67, 13) with width 34 and height 35.
; PLAN: r0=67(x), r1=13(y), r2=34(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 13
LDI r2, 34
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
