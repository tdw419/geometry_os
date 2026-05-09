; DESCRIPTION: Places a blue 53x82 rectangle at position (263, 44).
; PLAN: r0=263(x), r1=44(y), r2=53(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 44
LDI r2, 53
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
