; DESCRIPTION: Creates a yellow filled rectangle of size 59x48 starting at (140, 193).
; PLAN: r0=140(x), r1=193(y), r2=59(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 193
LDI r2, 59
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
