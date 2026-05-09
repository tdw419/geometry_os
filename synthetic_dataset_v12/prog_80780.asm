; DESCRIPTION: Places a white 104x42 rectangle at position (158, 68).
; PLAN: r0=158(x), r1=68(y), r2=104(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 68
LDI r2, 104
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
