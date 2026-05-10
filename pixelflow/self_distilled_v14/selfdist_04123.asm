; DESCRIPTION: Creates a purple filled rectangle of size 32x59 starting at (209, 102).
; PLAN: r0=209(x), r1=102(y), r2=32(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 102
LDI r2, 32
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
