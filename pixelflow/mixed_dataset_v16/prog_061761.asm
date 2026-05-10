; DESCRIPTION: Places a blue 106x11 box at position (335, 81).
; PLAN: r0=335(x), r1=81(y), r2=106(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 81
LDI r2, 106
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
