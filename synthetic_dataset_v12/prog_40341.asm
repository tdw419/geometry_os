; DESCRIPTION: Places a magenta 53x45 rectangle at position (278, 38).
; PLAN: r0=278(x), r1=38(y), r2=53(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 38
LDI r2, 53
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
