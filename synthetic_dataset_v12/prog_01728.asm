; DESCRIPTION: Draws a cyan rectangle at (34, 27) with width 97 and height 29.
; PLAN: r0=34(x), r1=27(y), r2=97(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 27
LDI r2, 97
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
