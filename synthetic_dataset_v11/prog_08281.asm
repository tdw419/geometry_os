; DESCRIPTION: Places a white 53x42 rectangle at position (137, 9).
; PLAN: r0=137(x), r1=9(y), r2=53(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 9
LDI r2, 53
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
