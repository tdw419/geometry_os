; DESCRIPTION: Creates a blue filled rectangle of size 65x83 starting at (134, 120).
; PLAN: r0=134(x), r1=120(y), r2=65(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 120
LDI r2, 65
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
