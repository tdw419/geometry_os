; DESCRIPTION: Creates a blue filled rectangle of size 35x98 starting at (130, 48).
; PLAN: r0=130(x), r1=48(y), r2=35(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 48
LDI r2, 35
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
