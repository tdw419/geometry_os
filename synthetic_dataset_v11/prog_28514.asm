; DESCRIPTION: Draws a cyan rectangle at (184, 21) with width 14 and height 93.
; PLAN: r0=184(x), r1=21(y), r2=14(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 21
LDI r2, 14
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
