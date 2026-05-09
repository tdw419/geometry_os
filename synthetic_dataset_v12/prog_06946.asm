; DESCRIPTION: Places a green 42x10 rectangle at position (461, 204).
; PLAN: r0=461(x), r1=204(y), r2=42(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 204
LDI r2, 42
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
