; DESCRIPTION: Creates a blue filled rectangle of size 37x85 starting at (209, 125).
; PLAN: r0=209(x), r1=125(y), r2=37(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 125
LDI r2, 37
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
