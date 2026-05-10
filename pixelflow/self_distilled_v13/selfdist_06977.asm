; DESCRIPTION: Creates a blue filled rectangle of size 36x33 starting at (38, 73).
; PLAN: r0=38(x), r1=73(y), r2=36(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 73
LDI r2, 36
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
