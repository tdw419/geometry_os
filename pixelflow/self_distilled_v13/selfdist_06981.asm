; DESCRIPTION: Creates a red filled rectangle of size 83x10 starting at (220, 38).
; PLAN: r0=220(x), r1=38(y), r2=83(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 38
LDI r2, 83
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
