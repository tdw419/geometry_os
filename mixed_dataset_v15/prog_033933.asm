; DESCRIPTION: Draws a cyan rectangle at (172, 150) with width 61 and height 15.
; PLAN: r0=172(x), r1=150(y), r2=61(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 150
LDI r2, 61
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
