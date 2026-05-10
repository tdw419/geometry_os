; DESCRIPTION: Draws a cyan rectangle at (40, 181) with width 98 and height 53.
; PLAN: r0=40(x), r1=181(y), r2=98(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 181
LDI r2, 98
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
