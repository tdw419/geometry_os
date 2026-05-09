; DESCRIPTION: Places a white 14x104 rectangle at position (109, 63).
; PLAN: r0=109(x), r1=63(y), r2=14(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 63
LDI r2, 14
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
