; DESCRIPTION: Draws a white rectangle at (373, 34) with width 65 and height 64.
; PLAN: r0=373(x), r1=34(y), r2=65(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 34
LDI r2, 65
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
