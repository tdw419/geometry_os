; DESCRIPTION: Places a blue 53x47 rectangle at position (184, 19).
; PLAN: r0=184(x), r1=19(y), r2=53(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 19
LDI r2, 53
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
