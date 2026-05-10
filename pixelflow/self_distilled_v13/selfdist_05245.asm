; DESCRIPTION: Creates a blue filled rectangle of size 119x41 starting at (259, 60).
; PLAN: r0=259(x), r1=60(y), r2=119(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 60
LDI r2, 119
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
