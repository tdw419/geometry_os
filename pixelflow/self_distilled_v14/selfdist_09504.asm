; DESCRIPTION: Creates a green filled rectangle of size 31x74 starting at (302, 192).
; PLAN: r0=302(x), r1=192(y), r2=31(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 192
LDI r2, 31
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
