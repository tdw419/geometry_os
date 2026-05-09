; DESCRIPTION: Places a blue 21x83 rectangle at position (83, 99).
; PLAN: r0=83(x), r1=99(y), r2=21(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 99
LDI r2, 21
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
