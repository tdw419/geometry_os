; DESCRIPTION: Places a blue 58x119 rectangle at position (260, 112).
; PLAN: r0=260(x), r1=112(y), r2=58(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 112
LDI r2, 58
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
