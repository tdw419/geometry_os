; DESCRIPTION: Draws a cyan rectangle at (216, 63) with width 76 and height 60.
; PLAN: r0=216(x), r1=63(y), r2=76(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 63
LDI r2, 76
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
