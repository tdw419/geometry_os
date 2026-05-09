; DESCRIPTION: Draws a white rectangle at (441, 30) with width 46 and height 44.
; PLAN: r0=441(x), r1=30(y), r2=46(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 30
LDI r2, 46
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
