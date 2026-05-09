; DESCRIPTION: Draws a cyan rectangle at (81, 210) with width 76 and height 44.
; PLAN: r0=81(x), r1=210(y), r2=76(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 210
LDI r2, 76
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
