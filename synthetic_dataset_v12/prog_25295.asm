; DESCRIPTION: Places a magenta 53x51 rectangle at position (439, 30).
; PLAN: r0=439(x), r1=30(y), r2=53(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 30
LDI r2, 53
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
