; DESCRIPTION: Draws a green rectangle at (296, 126) with width 31 and height 32.
; PLAN: r0=296(x), r1=126(y), r2=31(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 126
LDI r2, 31
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
