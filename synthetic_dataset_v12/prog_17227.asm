; DESCRIPTION: Draws a green rectangle at (422, 37) with width 64 and height 61.
; PLAN: r0=422(x), r1=37(y), r2=64(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 37
LDI r2, 64
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
