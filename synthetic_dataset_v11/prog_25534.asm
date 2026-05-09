; DESCRIPTION: Draws a white rectangle at (191, 193) with width 48 and height 35.
; PLAN: r0=191(x), r1=193(y), r2=48(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 193
LDI r2, 48
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
