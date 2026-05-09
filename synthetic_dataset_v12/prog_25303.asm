; DESCRIPTION: Draws a white rectangle at (330, 66) with width 45 and height 11.
; PLAN: r0=330(x), r1=66(y), r2=45(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 66
LDI r2, 45
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
