; DESCRIPTION: Draws a cyan rectangle at (241, 92) with width 70 and height 118.
; PLAN: r0=241(x), r1=92(y), r2=70(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 92
LDI r2, 70
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
