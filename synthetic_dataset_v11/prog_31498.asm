; DESCRIPTION: Draws a cyan rectangle at (69, 78) with width 89 and height 42.
; PLAN: r0=69(x), r1=78(y), r2=89(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 78
LDI r2, 89
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
