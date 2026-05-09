; DESCRIPTION: Places a purple 34x27 rectangle at position (148, 73).
; PLAN: r0=148(x), r1=73(y), r2=34(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 73
LDI r2, 34
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
