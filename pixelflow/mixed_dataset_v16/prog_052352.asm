; DESCRIPTION: Places a blue 40x73 rectangle at position (30, 44).
; PLAN: r0=30(x), r1=44(y), r2=40(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 44
LDI r2, 40
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
