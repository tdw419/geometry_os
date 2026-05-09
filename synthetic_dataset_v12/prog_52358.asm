; DESCRIPTION: Places a purple 92x57 rectangle at position (92, 136).
; PLAN: r0=92(x), r1=136(y), r2=92(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 136
LDI r2, 92
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
