; DESCRIPTION: Creates a blue filled rectangle of size 98x18 starting at (269, 3).
; PLAN: r0=269(x), r1=3(y), r2=98(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 3
LDI r2, 98
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
