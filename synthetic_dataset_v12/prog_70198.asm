; DESCRIPTION: Draws a cyan rectangle at (74, 27) with width 90 and height 76.
; PLAN: r0=74(x), r1=27(y), r2=90(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 27
LDI r2, 90
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
