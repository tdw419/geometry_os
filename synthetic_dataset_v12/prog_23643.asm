; DESCRIPTION: Places a blue 35x45 rectangle at position (466, 153).
; PLAN: r0=466(x), r1=153(y), r2=35(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 153
LDI r2, 35
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
