; DESCRIPTION: Places a white 104x84 rectangle at position (139, 50).
; PLAN: r0=139(x), r1=50(y), r2=104(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 50
LDI r2, 104
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
