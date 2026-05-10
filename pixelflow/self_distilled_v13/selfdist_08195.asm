; DESCRIPTION: Creates a green filled rectangle of size 68x102 starting at (176, 160).
; PLAN: r0=176(x), r1=160(y), r2=68(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 160
LDI r2, 68
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
