; DESCRIPTION: Draws a cyan rectangle at (327, 56) with width 88 and height 118.
; PLAN: r0=327(x), r1=56(y), r2=88(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 56
LDI r2, 88
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
