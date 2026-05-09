; DESCRIPTION: Places a green 64x82 rectangle at position (42, 74).
; PLAN: r0=42(x), r1=74(y), r2=64(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 74
LDI r2, 64
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
