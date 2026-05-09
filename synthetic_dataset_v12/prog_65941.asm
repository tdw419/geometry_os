; DESCRIPTION: Draws a white rectangle at (275, 57) with width 86 and height 55.
; PLAN: r0=275(x), r1=57(y), r2=86(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 57
LDI r2, 86
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
