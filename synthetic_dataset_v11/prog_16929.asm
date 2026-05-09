; DESCRIPTION: Draws a cyan rectangle at (128, 14) with width 67 and height 29.
; PLAN: r0=128(x), r1=14(y), r2=67(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 14
LDI r2, 67
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
