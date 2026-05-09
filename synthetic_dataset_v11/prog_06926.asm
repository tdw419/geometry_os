; DESCRIPTION: Places a purple 79x82 rectangle at position (72, 59).
; PLAN: r0=72(x), r1=59(y), r2=79(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 59
LDI r2, 79
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
