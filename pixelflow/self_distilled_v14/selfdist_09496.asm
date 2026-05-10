; DESCRIPTION: Draws a white rectangle at (225, 11) with width 50 and height 60.
; PLAN: r0=225(x), r1=11(y), r2=50(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 11
LDI r2, 50
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
