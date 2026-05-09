; DESCRIPTION: Places a blue 84x94 rectangle at position (73, 92).
; PLAN: r0=73(x), r1=92(y), r2=84(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 92
LDI r2, 84
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
