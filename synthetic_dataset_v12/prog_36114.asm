; DESCRIPTION: Places a blue 94x99 rectangle at position (77, 109).
; PLAN: r0=77(x), r1=109(y), r2=94(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 109
LDI r2, 94
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
