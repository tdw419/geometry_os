; DESCRIPTION: Places a white 104x75 rectangle at position (291, 42).
; PLAN: r0=291(x), r1=42(y), r2=104(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 42
LDI r2, 104
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
