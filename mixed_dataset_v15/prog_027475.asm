; DESCRIPTION: Creates a red filled rectangle of size 94x33 starting at (313, 114).
; PLAN: r0=313(x), r1=114(y), r2=94(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 114
LDI r2, 94
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
