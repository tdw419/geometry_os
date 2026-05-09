; DESCRIPTION: Draws a cyan rectangle at (131, 92) with width 13 and height 109.
; PLAN: r0=131(x), r1=92(y), r2=13(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 92
LDI r2, 13
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
