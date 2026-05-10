; DESCRIPTION: Creates a blue filled rectangle of size 83x40 starting at (307, 84).
; PLAN: r0=307(x), r1=84(y), r2=83(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 84
LDI r2, 83
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
