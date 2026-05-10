; DESCRIPTION: Creates a red filled rectangle of size 97x52 starting at (174, 138).
; PLAN: r0=174(x), r1=138(y), r2=97(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 138
LDI r2, 97
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
