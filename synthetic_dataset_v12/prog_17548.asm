; DESCRIPTION: Places a blue 53x85 rectangle at position (77, 30).
; PLAN: r0=77(x), r1=30(y), r2=53(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 30
LDI r2, 53
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
