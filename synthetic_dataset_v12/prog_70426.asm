; DESCRIPTION: Draws a cyan rectangle at (482, 11) with width 17 and height 76.
; PLAN: r0=482(x), r1=11(y), r2=17(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 11
LDI r2, 17
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
