; DESCRIPTION: Creates a red filled rectangle of size 102x32 starting at (169, 58).
; PLAN: r0=169(x), r1=58(y), r2=102(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 58
LDI r2, 102
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
