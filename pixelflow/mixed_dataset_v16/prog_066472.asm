; DESCRIPTION: Draws a green rectangle at (382, 161) with width 32 and height 75.
; PLAN: r0=382(x), r1=161(y), r2=32(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 161
LDI r2, 32
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
