; DESCRIPTION: Places a blue 31x60 rectangle at position (379, 126).
; PLAN: r0=379(x), r1=126(y), r2=31(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 126
LDI r2, 31
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
