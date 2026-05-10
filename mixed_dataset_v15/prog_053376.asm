; DESCRIPTION: Places a purple 11x57 rectangle at position (276, 164).
; PLAN: r0=276(x), r1=164(y), r2=11(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 164
LDI r2, 11
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
