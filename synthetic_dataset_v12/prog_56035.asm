; DESCRIPTION: Draws a green rectangle at (263, 206) with width 104 and height 31.
; PLAN: r0=263(x), r1=206(y), r2=104(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 206
LDI r2, 104
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
