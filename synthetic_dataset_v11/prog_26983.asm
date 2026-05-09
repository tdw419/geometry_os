; DESCRIPTION: Draws a white rectangle at (174, 77) with width 72 and height 77.
; PLAN: r0=174(x), r1=77(y), r2=72(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 77
LDI r2, 72
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
