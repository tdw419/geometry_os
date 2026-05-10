; DESCRIPTION: Creates a purple filled rectangle of size 102x27 starting at (149, 183).
; PLAN: r0=149(x), r1=183(y), r2=102(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 183
LDI r2, 102
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
