; DESCRIPTION: Places a purple 60x49 box at position (228, 7).
; PLAN: r0=228(x), r1=7(y), r2=60(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 7
LDI r2, 60
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
