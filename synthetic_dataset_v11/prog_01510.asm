; DESCRIPTION: Places a blue 65x44 rectangle at position (136, 102).
; PLAN: r0=136(x), r1=102(y), r2=65(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 102
LDI r2, 65
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
