; DESCRIPTION: Draws a cyan rectangle at (62, 173) with width 11 and height 69.
; PLAN: r0=62(x), r1=173(y), r2=11(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 173
LDI r2, 11
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
