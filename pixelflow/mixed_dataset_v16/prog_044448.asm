; DESCRIPTION: Places a green 32x19 rectangle at position (19, 82).
; PLAN: r0=19(x), r1=82(y), r2=32(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 82
LDI r2, 32
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
