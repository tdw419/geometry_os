; DESCRIPTION: Draws a cyan rectangle at (229, 67) with width 27 and height 88.
; PLAN: r0=229(x), r1=67(y), r2=27(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 67
LDI r2, 27
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
