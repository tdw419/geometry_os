; DESCRIPTION: Draws a cyan rectangle at (113, 92) with width 106 and height 115.
; PLAN: r0=113(x), r1=92(y), r2=106(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 92
LDI r2, 106
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
