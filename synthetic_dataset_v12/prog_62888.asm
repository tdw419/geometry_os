; DESCRIPTION: Places a magenta 25x83 rectangle at position (389, 19).
; PLAN: r0=389(x), r1=19(y), r2=25(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 19
LDI r2, 25
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
