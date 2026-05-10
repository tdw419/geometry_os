; DESCRIPTION: Places a blue 73x32 box at position (365, 60).
; PLAN: r0=365(x), r1=60(y), r2=73(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 60
LDI r2, 73
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
