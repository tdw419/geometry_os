; DESCRIPTION: Creates a yellow filled rectangle of size 60x30 starting at (337, 1).
; PLAN: r0=337(x), r1=1(y), r2=60(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 1
LDI r2, 60
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
