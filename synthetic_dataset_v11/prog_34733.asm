; DESCRIPTION: Places a blue 58x54 rectangle at position (83, 57).
; PLAN: r0=83(x), r1=57(y), r2=58(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 57
LDI r2, 58
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
