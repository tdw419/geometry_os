; DESCRIPTION: Draws a cyan rectangle at (203, 11) with width 120 and height 53.
; PLAN: r0=203(x), r1=11(y), r2=120(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 11
LDI r2, 120
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
