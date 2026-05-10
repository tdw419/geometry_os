; DESCRIPTION: Creates a white filled rectangle of size 19x59 starting at (105, 181).
; PLAN: r0=105(x), r1=181(y), r2=19(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 181
LDI r2, 19
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
