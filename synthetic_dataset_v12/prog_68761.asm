; DESCRIPTION: Draws a cyan rectangle at (171, 30) with width 52 and height 73.
; PLAN: r0=171(x), r1=30(y), r2=52(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 30
LDI r2, 52
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
