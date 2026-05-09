; DESCRIPTION: Draws a cyan rectangle at (266, 32) with width 70 and height 96.
; PLAN: r0=266(x), r1=32(y), r2=70(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 32
LDI r2, 70
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
