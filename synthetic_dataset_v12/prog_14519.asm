; DESCRIPTION: Draws a cyan rectangle at (197, 118) with width 53 and height 43.
; PLAN: r0=197(x), r1=118(y), r2=53(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 118
LDI r2, 53
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
