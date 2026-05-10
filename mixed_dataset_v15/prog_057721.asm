; DESCRIPTION: Creates a red filled rectangle of size 44x80 starting at (323, 170).
; PLAN: r0=323(x), r1=170(y), r2=44(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 170
LDI r2, 44
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
