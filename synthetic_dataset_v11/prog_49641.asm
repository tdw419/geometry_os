; DESCRIPTION: Places a white 79x113 rectangle at position (87, 42).
; PLAN: r0=87(x), r1=42(y), r2=79(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 42
LDI r2, 79
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
