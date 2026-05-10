; DESCRIPTION: Creates a blue filled rectangle of size 53x57 starting at (129, 173).
; PLAN: r0=129(x), r1=173(y), r2=53(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 173
LDI r2, 53
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
