; DESCRIPTION: Draws a cyan rectangle at (393, 39) with width 105 and height 67.
; PLAN: r0=393(x), r1=39(y), r2=105(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 39
LDI r2, 105
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
