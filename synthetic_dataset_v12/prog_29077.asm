; DESCRIPTION: Places a blue 94x65 rectangle at position (169, 6).
; PLAN: r0=169(x), r1=6(y), r2=94(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 6
LDI r2, 94
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
