; DESCRIPTION: Draws a cyan rectangle at (67, 39) with width 71 and height 21.
; PLAN: r0=67(x), r1=39(y), r2=71(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 39
LDI r2, 71
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
