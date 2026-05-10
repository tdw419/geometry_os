; DESCRIPTION: Draws a cyan rectangle at (126, 0) with width 119 and height 96.
; PLAN: r0=126(x), r1=0(y), r2=119(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 0
LDI r2, 119
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
