; DESCRIPTION: Places a white 104x84 rectangle at position (296, 105).
; PLAN: r0=296(x), r1=105(y), r2=104(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 105
LDI r2, 104
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
