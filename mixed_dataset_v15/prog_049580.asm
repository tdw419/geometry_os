; DESCRIPTION: Draws a cyan rectangle at (84, 76) with width 45 and height 103.
; PLAN: r0=84(x), r1=76(y), r2=45(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 76
LDI r2, 45
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
