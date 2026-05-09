; DESCRIPTION: Draws a white rectangle at (130, 181) with width 45 and height 48.
; PLAN: r0=130(x), r1=181(y), r2=45(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 181
LDI r2, 45
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
