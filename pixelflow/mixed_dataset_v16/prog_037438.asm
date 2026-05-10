; DESCRIPTION: Places a blue 89x50 rectangle at position (373, 139).
; PLAN: r0=373(x), r1=139(y), r2=89(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 139
LDI r2, 89
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
