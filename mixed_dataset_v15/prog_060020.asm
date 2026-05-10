; DESCRIPTION: Places a purple 61x85 rectangle at position (240, 32).
; PLAN: r0=240(x), r1=32(y), r2=61(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 32
LDI r2, 61
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
