; DESCRIPTION: Creates a blue filled rectangle of size 27x14 starting at (337, 72).
; PLAN: r0=337(x), r1=72(y), r2=27(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 72
LDI r2, 27
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
