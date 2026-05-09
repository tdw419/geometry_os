; DESCRIPTION: Draws a cyan rectangle at (31, 46) with width 76 and height 81.
; PLAN: r0=31(x), r1=46(y), r2=76(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 46
LDI r2, 76
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
