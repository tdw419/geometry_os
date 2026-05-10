; DESCRIPTION: Places a blue 66x120 rectangle at position (140, 44).
; PLAN: r0=140(x), r1=44(y), r2=66(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 44
LDI r2, 66
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
