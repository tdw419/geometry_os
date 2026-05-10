; DESCRIPTION: Places a blue 31x42 rectangle at position (205, 188).
; PLAN: r0=205(x), r1=188(y), r2=31(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 188
LDI r2, 31
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
