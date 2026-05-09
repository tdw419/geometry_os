; DESCRIPTION: Places a blue 23x47 rectangle at position (140, 138).
; PLAN: r0=140(x), r1=138(y), r2=23(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 138
LDI r2, 23
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
