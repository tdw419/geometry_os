; DESCRIPTION: Places a black 93x43 rectangle at position (356, 92).
; PLAN: r0=356(x), r1=92(y), r2=93(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 92
LDI r2, 93
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
