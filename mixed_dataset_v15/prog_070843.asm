; DESCRIPTION: Creates a blue filled rectangle of size 99x39 starting at (247, 82).
; PLAN: r0=247(x), r1=82(y), r2=99(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 82
LDI r2, 99
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
