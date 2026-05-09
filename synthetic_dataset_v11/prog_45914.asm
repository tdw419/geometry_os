; DESCRIPTION: Draws a cyan rectangle at (40, 68) with width 60 and height 97.
; PLAN: r0=40(x), r1=68(y), r2=60(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 68
LDI r2, 60
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
