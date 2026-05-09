; DESCRIPTION: Places a blue 82x83 rectangle at position (2, 118).
; PLAN: r0=2(x), r1=118(y), r2=82(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 118
LDI r2, 82
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
