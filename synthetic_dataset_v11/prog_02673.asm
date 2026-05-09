; DESCRIPTION: Draws a cyan rectangle at (159, 150) with width 44 and height 67.
; PLAN: r0=159(x), r1=150(y), r2=44(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 150
LDI r2, 44
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
