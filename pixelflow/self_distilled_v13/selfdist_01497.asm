; DESCRIPTION: Creates a blue filled rectangle of size 101x27 starting at (99, 178).
; PLAN: r0=99(x), r1=178(y), r2=101(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 178
LDI r2, 101
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
