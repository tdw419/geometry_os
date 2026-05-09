; DESCRIPTION: Draws a cyan rectangle at (109, 100) with width 56 and height 49.
; PLAN: r0=109(x), r1=100(y), r2=56(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 100
LDI r2, 56
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
