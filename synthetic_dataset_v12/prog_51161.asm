; DESCRIPTION: Places a blue 89x112 rectangle at position (157, 32).
; PLAN: r0=157(x), r1=32(y), r2=89(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 32
LDI r2, 89
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
