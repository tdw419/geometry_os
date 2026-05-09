; DESCRIPTION: Places a purple 71x107 rectangle at position (23, 61).
; PLAN: r0=23(x), r1=61(y), r2=71(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 61
LDI r2, 71
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
