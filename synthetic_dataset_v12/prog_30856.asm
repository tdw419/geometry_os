; DESCRIPTION: Draws a green rectangle at (487, 188) with width 14 and height 49.
; PLAN: r0=487(x), r1=188(y), r2=14(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 188
LDI r2, 14
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
