; DESCRIPTION: Draws a green rectangle at (52, 31) with width 27 and height 103.
; PLAN: r0=52(x), r1=31(y), r2=27(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 31
LDI r2, 27
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
