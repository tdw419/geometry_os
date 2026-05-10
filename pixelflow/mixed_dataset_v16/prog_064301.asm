; DESCRIPTION: Places a blue 48x34 rectangle at position (319, 131).
; PLAN: r0=319(x), r1=131(y), r2=48(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 131
LDI r2, 48
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
