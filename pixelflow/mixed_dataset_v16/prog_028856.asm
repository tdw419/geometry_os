; DESCRIPTION: Draws a cyan rectangle at (411, 39) with width 44 and height 34.
; PLAN: r0=411(x), r1=39(y), r2=44(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 39
LDI r2, 44
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
