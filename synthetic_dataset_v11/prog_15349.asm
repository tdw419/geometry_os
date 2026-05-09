; DESCRIPTION: Draws a white rectangle at (86, 151) with width 27 and height 33.
; PLAN: r0=86(x), r1=151(y), r2=27(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 151
LDI r2, 27
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
