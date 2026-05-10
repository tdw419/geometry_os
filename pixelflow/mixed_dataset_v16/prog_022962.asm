; DESCRIPTION: Creates a blue filled rectangle of size 64x75 starting at (12, 178).
; PLAN: r0=12(x), r1=178(y), r2=64(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 178
LDI r2, 64
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
