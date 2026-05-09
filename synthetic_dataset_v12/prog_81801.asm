; DESCRIPTION: Draws a cyan rectangle at (350, 121) with width 96 and height 77.
; PLAN: r0=350(x), r1=121(y), r2=96(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 121
LDI r2, 96
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
