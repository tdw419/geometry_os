; DESCRIPTION: Places a purple 14x87 rectangle at position (92, 133).
; PLAN: r0=92(x), r1=133(y), r2=14(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 133
LDI r2, 14
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
