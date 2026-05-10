; DESCRIPTION: Draws a white rectangle at (268, 223) with width 48 and height 21.
; PLAN: r0=268(x), r1=223(y), r2=48(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 223
LDI r2, 48
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
