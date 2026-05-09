; DESCRIPTION: Places a purple 20x72 rectangle at position (81, 92).
; PLAN: r0=81(x), r1=92(y), r2=20(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 92
LDI r2, 20
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
