; DESCRIPTION: Places a blue 29x73 rectangle at position (251, 131).
; PLAN: r0=251(x), r1=131(y), r2=29(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 131
LDI r2, 29
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
