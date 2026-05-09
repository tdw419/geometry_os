; DESCRIPTION: Places a blue 65x48 rectangle at position (8, 26).
; PLAN: r0=8(x), r1=26(y), r2=65(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 26
LDI r2, 65
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
