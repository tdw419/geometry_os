; DESCRIPTION: Places a blue 57x11 rectangle at position (54, 140).
; PLAN: r0=54(x), r1=140(y), r2=57(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 140
LDI r2, 57
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
