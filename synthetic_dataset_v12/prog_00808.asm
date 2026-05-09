; DESCRIPTION: Draws a cyan rectangle at (350, 92) with width 67 and height 49.
; PLAN: r0=350(x), r1=92(y), r2=67(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 92
LDI r2, 67
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
