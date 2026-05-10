; DESCRIPTION: Draws a cyan rectangle at (240, 141) with width 113 and height 74.
; PLAN: r0=240(x), r1=141(y), r2=113(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 141
LDI r2, 113
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
