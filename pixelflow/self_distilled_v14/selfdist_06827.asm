; DESCRIPTION: Creates a green filled rectangle of size 93x70 starting at (46, 26).
; PLAN: r0=46(x), r1=26(y), r2=93(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 26
LDI r2, 93
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
