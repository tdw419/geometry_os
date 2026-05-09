; DESCRIPTION: Draws a cyan rectangle at (115, 157) with width 103 and height 37.
; PLAN: r0=115(x), r1=157(y), r2=103(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 157
LDI r2, 103
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
