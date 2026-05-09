; DESCRIPTION: Places a purple 83x93 rectangle at position (293, 135).
; PLAN: r0=293(x), r1=135(y), r2=83(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 135
LDI r2, 83
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
