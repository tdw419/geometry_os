; DESCRIPTION: Draws a cyan rectangle at (182, 198) with width 61 and height 43.
; PLAN: r0=182(x), r1=198(y), r2=61(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 198
LDI r2, 61
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
