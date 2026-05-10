; DESCRIPTION: Creates a green filled rectangle of size 53x72 starting at (214, 129).
; PLAN: r0=214(x), r1=129(y), r2=53(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 129
LDI r2, 53
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
