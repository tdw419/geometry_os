; DESCRIPTION: Creates a red filled rectangle of size 44x37 starting at (3, 144).
; PLAN: r0=3(x), r1=144(y), r2=44(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 144
LDI r2, 44
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
