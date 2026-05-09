; DESCRIPTION: Draws a white rectangle at (108, 199) with width 86 and height 57.
; PLAN: r0=108(x), r1=199(y), r2=86(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 199
LDI r2, 86
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
