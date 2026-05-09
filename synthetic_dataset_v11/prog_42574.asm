; DESCRIPTION: Places a blue 76x48 rectangle at position (66, 145).
; PLAN: r0=66(x), r1=145(y), r2=76(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 145
LDI r2, 76
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
