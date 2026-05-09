; DESCRIPTION: Draws a white rectangle at (87, 82) with width 117 and height 104.
; PLAN: r0=87(x), r1=82(y), r2=117(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 82
LDI r2, 117
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
