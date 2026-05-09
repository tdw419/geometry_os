; DESCRIPTION: Draws a white rectangle at (27, 77) with width 84 and height 82.
; PLAN: r0=27(x), r1=77(y), r2=84(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 77
LDI r2, 84
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
