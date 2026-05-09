; DESCRIPTION: Draws a black rectangle at (293, 85) with width 48 and height 104.
; PLAN: r0=293(x), r1=85(y), r2=48(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 85
LDI r2, 48
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
