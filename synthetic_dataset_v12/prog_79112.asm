; DESCRIPTION: Draws a cyan rectangle at (203, 58) with width 28 and height 57.
; PLAN: r0=203(x), r1=58(y), r2=28(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 58
LDI r2, 28
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
