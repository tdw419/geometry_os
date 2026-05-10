; DESCRIPTION: Draws a cyan rectangle at (56, 92) with width 109 and height 36.
; PLAN: r0=56(x), r1=92(y), r2=109(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 92
LDI r2, 109
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
