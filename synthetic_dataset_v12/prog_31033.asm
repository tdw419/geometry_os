; DESCRIPTION: Places a blue 24x26 rectangle at position (392, 145).
; PLAN: r0=392(x), r1=145(y), r2=24(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 145
LDI r2, 24
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
