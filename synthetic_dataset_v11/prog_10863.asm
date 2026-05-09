; DESCRIPTION: Draws a white rectangle at (180, 32) with width 68 and height 104.
; PLAN: r0=180(x), r1=32(y), r2=68(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 32
LDI r2, 68
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
