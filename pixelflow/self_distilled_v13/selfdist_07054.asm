; DESCRIPTION: Creates a blue filled rectangle of size 17x39 starting at (322, 199).
; PLAN: r0=322(x), r1=199(y), r2=17(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 199
LDI r2, 17
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
