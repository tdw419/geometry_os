; DESCRIPTION: Draws a cyan rectangle at (234, 93) with width 98 and height 114.
; PLAN: r0=234(x), r1=93(y), r2=98(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 93
LDI r2, 98
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
