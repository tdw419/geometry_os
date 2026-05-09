; DESCRIPTION: Draws a cyan rectangle at (324, 131) with width 81 and height 11.
; PLAN: r0=324(x), r1=131(y), r2=81(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 131
LDI r2, 81
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
