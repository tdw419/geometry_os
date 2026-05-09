; DESCRIPTION: Places a blue 57x31 rectangle at position (279, 22).
; PLAN: r0=279(x), r1=22(y), r2=57(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 22
LDI r2, 57
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
