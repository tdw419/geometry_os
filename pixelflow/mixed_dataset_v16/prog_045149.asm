; DESCRIPTION: Creates a red filled rectangle of size 59x47 starting at (324, 22).
; PLAN: r0=324(x), r1=22(y), r2=59(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 22
LDI r2, 59
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
