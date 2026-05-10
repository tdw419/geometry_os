; DESCRIPTION: Creates a yellow filled rectangle of size 24x110 starting at (59, 142).
; PLAN: r0=59(x), r1=142(y), r2=24(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 142
LDI r2, 24
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
