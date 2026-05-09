; DESCRIPTION: Draws a cyan rectangle at (206, 183) with width 75 and height 38.
; PLAN: r0=206(x), r1=183(y), r2=75(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 183
LDI r2, 75
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
