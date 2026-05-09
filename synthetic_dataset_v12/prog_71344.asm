; DESCRIPTION: Places a red 16x42 rectangle at position (201, 189).
; PLAN: r0=201(x), r1=189(y), r2=16(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 189
LDI r2, 16
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
