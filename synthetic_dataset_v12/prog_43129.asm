; DESCRIPTION: Places a purple 103x61 rectangle at position (60, 2).
; PLAN: r0=60(x), r1=2(y), r2=103(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 2
LDI r2, 103
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
