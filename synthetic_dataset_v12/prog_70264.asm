; DESCRIPTION: Places a blue 71x89 rectangle at position (60, 90).
; PLAN: r0=60(x), r1=90(y), r2=71(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 90
LDI r2, 71
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
