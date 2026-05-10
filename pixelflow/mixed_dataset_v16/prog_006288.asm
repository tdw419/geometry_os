; DESCRIPTION: Places a blue 53x77 box at position (255, 82).
; PLAN: r0=255(x), r1=82(y), r2=53(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 82
LDI r2, 53
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
