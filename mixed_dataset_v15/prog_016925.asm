; DESCRIPTION: Creates a green filled rectangle of size 55x16 starting at (251, 141).
; PLAN: r0=251(x), r1=141(y), r2=55(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 141
LDI r2, 55
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
