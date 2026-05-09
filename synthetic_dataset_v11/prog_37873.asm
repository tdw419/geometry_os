; DESCRIPTION: Places a purple 114x61 rectangle at position (120, 170).
; PLAN: r0=120(x), r1=170(y), r2=114(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 170
LDI r2, 114
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
