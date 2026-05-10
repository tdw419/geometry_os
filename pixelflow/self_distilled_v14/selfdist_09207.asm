; DESCRIPTION: Creates a red filled rectangle of size 83x44 starting at (327, 40).
; PLAN: r0=327(x), r1=40(y), r2=83(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 40
LDI r2, 83
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
