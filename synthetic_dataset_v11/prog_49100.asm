; DESCRIPTION: Places a white 28x42 rectangle at position (87, 9).
; PLAN: r0=87(x), r1=9(y), r2=28(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 9
LDI r2, 28
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
