; DESCRIPTION: Draws a cyan rectangle at (5, 62) with width 60 and height 109.
; PLAN: r0=5(x), r1=62(y), r2=60(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 62
LDI r2, 60
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
