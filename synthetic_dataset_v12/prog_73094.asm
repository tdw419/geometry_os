; DESCRIPTION: Places a purple 98x39 rectangle at position (297, 61).
; PLAN: r0=297(x), r1=61(y), r2=98(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 61
LDI r2, 98
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
