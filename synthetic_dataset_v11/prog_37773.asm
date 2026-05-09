; DESCRIPTION: Draws a cyan rectangle at (8, 237) with width 49 and height 18.
; PLAN: r0=8(x), r1=237(y), r2=49(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 237
LDI r2, 49
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
