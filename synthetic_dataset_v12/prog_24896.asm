; DESCRIPTION: Draws a cyan rectangle at (382, 123) with width 70 and height 109.
; PLAN: r0=382(x), r1=123(y), r2=70(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 123
LDI r2, 70
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
