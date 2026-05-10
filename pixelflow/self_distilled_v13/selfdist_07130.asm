; DESCRIPTION: Draws a cyan rectangle at (24, 47) with width 114 and height 76.
; PLAN: r0=24(x), r1=47(y), r2=114(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 47
LDI r2, 114
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
