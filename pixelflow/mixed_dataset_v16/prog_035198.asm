; DESCRIPTION: Creates a blue filled rectangle of size 14x91 starting at (242, 194).
; PLAN: r0=242(x), r1=194(y), r2=14(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 194
LDI r2, 14
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
