; DESCRIPTION: Draws a green rectangle at (27, 52) with width 57 and height 30.
; PLAN: r0=27(x), r1=52(y), r2=57(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 52
LDI r2, 57
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
