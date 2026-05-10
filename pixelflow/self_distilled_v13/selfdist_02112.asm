; DESCRIPTION: Creates a yellow filled rectangle of size 59x34 starting at (271, 91).
; PLAN: r0=271(x), r1=91(y), r2=59(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 91
LDI r2, 59
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
