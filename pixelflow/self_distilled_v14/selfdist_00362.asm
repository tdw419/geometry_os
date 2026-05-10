; DESCRIPTION: Creates a purple filled rectangle of size 27x117 starting at (238, 137).
; PLAN: r0=238(x), r1=137(y), r2=27(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 137
LDI r2, 27
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
