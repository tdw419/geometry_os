; DESCRIPTION: Creates a yellow filled rectangle of size 51x34 starting at (379, 168).
; PLAN: r0=379(x), r1=168(y), r2=51(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 168
LDI r2, 51
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
