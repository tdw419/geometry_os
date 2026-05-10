; DESCRIPTION: Draws a white rectangle at (176, 18) with width 27 and height 31.
; PLAN: r0=176(x), r1=18(y), r2=27(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 18
LDI r2, 27
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
