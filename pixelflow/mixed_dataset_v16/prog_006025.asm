; DESCRIPTION: Places a blue 79x99 rectangle at position (39, 130).
; PLAN: r0=39(x), r1=130(y), r2=79(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 130
LDI r2, 79
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
