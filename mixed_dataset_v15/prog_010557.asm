; DESCRIPTION: Creates a yellow filled rectangle of size 108x59 starting at (119, 142).
; PLAN: r0=119(x), r1=142(y), r2=108(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 142
LDI r2, 108
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
