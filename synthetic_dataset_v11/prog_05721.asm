; DESCRIPTION: Draws a cyan rectangle at (61, 1) with width 114 and height 34.
; PLAN: r0=61(x), r1=1(y), r2=114(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 1
LDI r2, 114
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
