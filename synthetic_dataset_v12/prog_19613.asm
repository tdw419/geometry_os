; DESCRIPTION: Draws a cyan rectangle at (379, 86) with width 81 and height 118.
; PLAN: r0=379(x), r1=86(y), r2=81(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 86
LDI r2, 81
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
