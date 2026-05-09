; DESCRIPTION: Places a blue 24x23 rectangle at position (114, 57).
; PLAN: r0=114(x), r1=57(y), r2=24(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 57
LDI r2, 24
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
