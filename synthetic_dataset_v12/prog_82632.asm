; DESCRIPTION: Draws a cyan rectangle at (385, 85) with width 18 and height 67.
; PLAN: r0=385(x), r1=85(y), r2=18(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 85
LDI r2, 18
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
