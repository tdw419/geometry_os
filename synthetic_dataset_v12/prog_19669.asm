; DESCRIPTION: Places a white 105x63 rectangle at position (11, 104).
; PLAN: r0=11(x), r1=104(y), r2=105(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 104
LDI r2, 105
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
