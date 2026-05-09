; DESCRIPTION: Places a white 93x84 rectangle at position (58, 140).
; PLAN: r0=58(x), r1=140(y), r2=93(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 140
LDI r2, 93
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
