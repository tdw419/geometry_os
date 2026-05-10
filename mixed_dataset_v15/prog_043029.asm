; DESCRIPTION: Places a purple 60x31 rectangle at position (266, 117).
; PLAN: r0=266(x), r1=117(y), r2=60(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 117
LDI r2, 60
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
