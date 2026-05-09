; DESCRIPTION: Places a blue 60x87 rectangle at position (413, 144).
; PLAN: r0=413(x), r1=144(y), r2=60(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 144
LDI r2, 60
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
