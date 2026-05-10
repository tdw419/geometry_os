; DESCRIPTION: Draws a cyan rectangle at (431, 1) with width 67 and height 68.
; PLAN: r0=431(x), r1=1(y), r2=67(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 1
LDI r2, 67
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
