; DESCRIPTION: Places a purple 79x26 rectangle at position (154, 133).
; PLAN: r0=154(x), r1=133(y), r2=79(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 133
LDI r2, 79
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
