; DESCRIPTION: Draws a cyan rectangle at (100, 15) with width 49 and height 16.
; PLAN: r0=100(x), r1=15(y), r2=49(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 15
LDI r2, 49
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
