; DESCRIPTION: Draws a cyan rectangle at (56, 136) with width 82 and height 108.
; PLAN: r0=56(x), r1=136(y), r2=82(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 136
LDI r2, 82
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
