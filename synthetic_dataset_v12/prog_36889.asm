; DESCRIPTION: Places a purple 86x98 rectangle at position (4, 79).
; PLAN: r0=4(x), r1=79(y), r2=86(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 79
LDI r2, 86
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
