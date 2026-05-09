; DESCRIPTION: Draws a green rectangle at (422, 165) with width 47 and height 10.
; PLAN: r0=422(x), r1=165(y), r2=47(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 165
LDI r2, 47
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
