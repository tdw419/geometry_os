; DESCRIPTION: Places a purple 72x92 rectangle at position (84, 134).
; PLAN: r0=84(x), r1=134(y), r2=72(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 134
LDI r2, 72
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
