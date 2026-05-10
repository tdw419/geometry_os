; DESCRIPTION: Draws a cyan rectangle at (204, 6) with width 69 and height 13.
; PLAN: r0=204(x), r1=6(y), r2=69(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 6
LDI r2, 69
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
