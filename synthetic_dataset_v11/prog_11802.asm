; DESCRIPTION: Places a blue 31x106 rectangle at position (190, 149).
; PLAN: r0=190(x), r1=149(y), r2=31(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 149
LDI r2, 31
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
