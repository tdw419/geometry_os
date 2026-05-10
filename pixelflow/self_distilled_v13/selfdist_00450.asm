; DESCRIPTION: Creates a red filled rectangle of size 73x79 starting at (33, 15).
; PLAN: r0=33(x), r1=15(y), r2=73(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 15
LDI r2, 73
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
