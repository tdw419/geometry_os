; DESCRIPTION: Draws a cyan rectangle at (72, 132) with width 57 and height 118.
; PLAN: r0=72(x), r1=132(y), r2=57(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 132
LDI r2, 57
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
