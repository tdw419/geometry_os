; DESCRIPTION: Places a blue 107x95 rectangle at position (8, 128).
; PLAN: r0=8(x), r1=128(y), r2=107(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 128
LDI r2, 107
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
