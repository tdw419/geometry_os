; DESCRIPTION: Places a blue 109x92 rectangle at position (382, 47).
; PLAN: r0=382(x), r1=47(y), r2=109(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 47
LDI r2, 109
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
