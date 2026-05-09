; DESCRIPTION: Places a green 82x66 rectangle at position (131, 176).
; PLAN: r0=131(x), r1=176(y), r2=82(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 176
LDI r2, 82
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
