; DESCRIPTION: Creates a green filled rectangle of size 39x33 starting at (252, 30).
; PLAN: r0=252(x), r1=30(y), r2=39(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 30
LDI r2, 39
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
