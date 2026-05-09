; DESCRIPTION: Draws a cyan rectangle at (326, 120) with width 35 and height 101.
; PLAN: r0=326(x), r1=120(y), r2=35(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 120
LDI r2, 35
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
