; DESCRIPTION: Places a green 42x110 rectangle at position (82, 103).
; PLAN: r0=82(x), r1=103(y), r2=42(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 103
LDI r2, 42
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
