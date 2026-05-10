; DESCRIPTION: Draws a cyan rectangle at (476, 95) with width 18 and height 35.
; PLAN: r0=476(x), r1=95(y), r2=18(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 95
LDI r2, 18
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
