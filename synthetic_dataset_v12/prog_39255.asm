; DESCRIPTION: Draws a cyan rectangle at (58, 116) with width 96 and height 67.
; PLAN: r0=58(x), r1=116(y), r2=96(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 116
LDI r2, 96
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
