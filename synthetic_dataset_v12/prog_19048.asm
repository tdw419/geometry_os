; DESCRIPTION: Places a purple 92x24 rectangle at position (68, 36).
; PLAN: r0=68(x), r1=36(y), r2=92(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 36
LDI r2, 92
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
