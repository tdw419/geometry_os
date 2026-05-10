; DESCRIPTION: Creates a green filled rectangle of size 73x25 starting at (115, 59).
; PLAN: r0=115(x), r1=59(y), r2=73(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 59
LDI r2, 73
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
