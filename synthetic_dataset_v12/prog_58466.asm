; DESCRIPTION: Draws a cyan rectangle at (157, 74) with width 29 and height 109.
; PLAN: r0=157(x), r1=74(y), r2=29(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 74
LDI r2, 29
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
