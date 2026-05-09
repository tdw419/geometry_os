; DESCRIPTION: Draws a cyan rectangle at (220, 157) with width 108 and height 86.
; PLAN: r0=220(x), r1=157(y), r2=108(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 157
LDI r2, 108
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
