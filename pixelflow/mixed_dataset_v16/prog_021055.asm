; DESCRIPTION: Places a red 87x79 rectangle at position (244, 42).
; PLAN: r0=244(x), r1=42(y), r2=87(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 42
LDI r2, 87
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
