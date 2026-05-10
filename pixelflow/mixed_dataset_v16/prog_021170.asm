; DESCRIPTION: Draws a cyan rectangle at (314, 66) with width 64 and height 25.
; PLAN: r0=314(x), r1=66(y), r2=64(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 66
LDI r2, 64
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
