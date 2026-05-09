; DESCRIPTION: Places a blue 90x104 rectangle at position (149, 139).
; PLAN: r0=149(x), r1=139(y), r2=90(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 139
LDI r2, 90
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
