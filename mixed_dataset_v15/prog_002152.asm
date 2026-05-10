; DESCRIPTION: Draws a cyan rectangle at (11, 131) with width 12 and height 115.
; PLAN: r0=11(x), r1=131(y), r2=12(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 131
LDI r2, 12
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
