; DESCRIPTION: Draws a cyan rectangle at (43, 12) with width 43 and height 87.
; PLAN: r0=43(x), r1=12(y), r2=43(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 12
LDI r2, 43
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
