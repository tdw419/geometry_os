; DESCRIPTION: Places a blue 53x117 rectangle at position (12, 47).
; PLAN: r0=12(x), r1=47(y), r2=53(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 47
LDI r2, 53
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
