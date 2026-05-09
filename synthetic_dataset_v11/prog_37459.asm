; DESCRIPTION: Places a purple 102x119 rectangle at position (148, 14).
; PLAN: r0=148(x), r1=14(y), r2=102(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 14
LDI r2, 102
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
