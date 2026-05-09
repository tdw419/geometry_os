; DESCRIPTION: Places a white 90x37 rectangle at position (83, 32).
; PLAN: r0=83(x), r1=32(y), r2=90(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 32
LDI r2, 90
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
