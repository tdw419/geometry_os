; DESCRIPTION: Creates a green filled rectangle of size 93x62 starting at (386, 188).
; PLAN: r0=386(x), r1=188(y), r2=93(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 188
LDI r2, 93
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
