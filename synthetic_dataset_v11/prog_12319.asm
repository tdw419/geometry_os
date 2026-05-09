; DESCRIPTION: Places a blue 101x44 rectangle at position (140, 38).
; PLAN: r0=140(x), r1=38(y), r2=101(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 38
LDI r2, 101
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
