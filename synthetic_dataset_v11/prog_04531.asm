; DESCRIPTION: Draws a green rectangle at (217, 16) with width 31 and height 76.
; PLAN: r0=217(x), r1=16(y), r2=31(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 16
LDI r2, 31
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
