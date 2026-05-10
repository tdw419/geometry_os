; DESCRIPTION: Draws a cyan rectangle at (34, 16) with width 44 and height 43.
; PLAN: r0=34(x), r1=16(y), r2=44(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 16
LDI r2, 44
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
