; DESCRIPTION: Creates a purple filled rectangle of size 16x76 starting at (22, 27).
; PLAN: r0=22(x), r1=27(y), r2=16(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 27
LDI r2, 16
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
