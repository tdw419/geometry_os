; DESCRIPTION: Places a purple 65x11 rectangle at position (447, 92).
; PLAN: r0=447(x), r1=92(y), r2=65(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 92
LDI r2, 65
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
