; DESCRIPTION: Draws a cyan rectangle at (411, 113) with width 67 and height 109.
; PLAN: r0=411(x), r1=113(y), r2=67(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 113
LDI r2, 67
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
