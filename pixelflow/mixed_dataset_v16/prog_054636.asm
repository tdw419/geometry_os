; DESCRIPTION: Draws a cyan rectangle at (383, 76) with width 90 and height 23.
; PLAN: r0=383(x), r1=76(y), r2=90(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 76
LDI r2, 90
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
