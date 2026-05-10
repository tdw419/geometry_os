; DESCRIPTION: Draws a cyan rectangle at (430, 67) with width 71 and height 112.
; PLAN: r0=430(x), r1=67(y), r2=71(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 67
LDI r2, 71
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
