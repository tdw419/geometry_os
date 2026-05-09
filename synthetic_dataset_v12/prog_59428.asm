; DESCRIPTION: Draws a cyan rectangle at (248, 113) with width 87 and height 12.
; PLAN: r0=248(x), r1=113(y), r2=87(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 113
LDI r2, 87
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
