; DESCRIPTION: Places a purple 100x113 rectangle at position (131, 75).
; PLAN: r0=131(x), r1=75(y), r2=100(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 75
LDI r2, 100
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
