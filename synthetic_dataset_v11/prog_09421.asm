; DESCRIPTION: Draws a cyan rectangle at (34, 8) with width 57 and height 101.
; PLAN: r0=34(x), r1=8(y), r2=57(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 8
LDI r2, 57
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
