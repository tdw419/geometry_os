; DESCRIPTION: Places a blue 94x85 rectangle at position (81, 78).
; PLAN: r0=81(x), r1=78(y), r2=94(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 78
LDI r2, 94
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
