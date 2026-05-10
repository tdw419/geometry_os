; DESCRIPTION: Creates a green filled rectangle of size 22x75 starting at (172, 177).
; PLAN: r0=172(x), r1=177(y), r2=22(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 177
LDI r2, 22
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
