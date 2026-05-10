; DESCRIPTION: Creates a green filled rectangle of size 107x83 starting at (289, 141).
; PLAN: r0=289(x), r1=141(y), r2=107(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 141
LDI r2, 107
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
