; DESCRIPTION: Draws a white rectangle at (349, 12) with width 27 and height 29.
; PLAN: r0=349(x), r1=12(y), r2=27(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 12
LDI r2, 27
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
