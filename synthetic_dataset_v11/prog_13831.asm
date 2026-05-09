; DESCRIPTION: Places a purple 70x81 rectangle at position (79, 68).
; PLAN: r0=79(x), r1=68(y), r2=70(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 68
LDI r2, 70
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
