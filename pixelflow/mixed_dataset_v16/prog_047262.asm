; DESCRIPTION: Draws a cyan rectangle at (257, 35) with width 113 and height 114.
; PLAN: r0=257(x), r1=35(y), r2=113(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 35
LDI r2, 113
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
