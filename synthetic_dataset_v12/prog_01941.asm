; DESCRIPTION: Places a blue 57x101 rectangle at position (249, 132).
; PLAN: r0=249(x), r1=132(y), r2=57(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 132
LDI r2, 57
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
