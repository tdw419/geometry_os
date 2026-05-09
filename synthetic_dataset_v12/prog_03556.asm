; DESCRIPTION: Draws a white rectangle at (422, 0) with width 76 and height 13.
; PLAN: r0=422(x), r1=0(y), r2=76(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 0
LDI r2, 76
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
