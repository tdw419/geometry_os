; DESCRIPTION: Places a purple 76x71 rectangle at position (276, 103).
; PLAN: r0=276(x), r1=103(y), r2=76(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 103
LDI r2, 76
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
