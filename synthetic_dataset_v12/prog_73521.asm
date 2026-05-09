; DESCRIPTION: Places a blue 92x94 rectangle at position (282, 89).
; PLAN: r0=282(x), r1=89(y), r2=92(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 89
LDI r2, 92
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
