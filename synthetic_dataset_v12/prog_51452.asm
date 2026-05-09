; DESCRIPTION: Draws a cyan rectangle at (90, 113) with width 45 and height 85.
; PLAN: r0=90(x), r1=113(y), r2=45(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 113
LDI r2, 45
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
