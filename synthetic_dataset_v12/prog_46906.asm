; DESCRIPTION: Places a blue 21x97 rectangle at position (273, 109).
; PLAN: r0=273(x), r1=109(y), r2=21(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 109
LDI r2, 21
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
