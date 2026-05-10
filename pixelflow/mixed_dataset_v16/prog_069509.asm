; DESCRIPTION: Places a blue 94x60 rectangle at position (279, 89).
; PLAN: r0=279(x), r1=89(y), r2=94(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 89
LDI r2, 94
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
