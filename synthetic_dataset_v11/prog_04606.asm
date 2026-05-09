; DESCRIPTION: Places a blue 78x71 rectangle at position (89, 139).
; PLAN: r0=89(x), r1=139(y), r2=78(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 139
LDI r2, 78
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
