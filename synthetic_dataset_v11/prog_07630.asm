; DESCRIPTION: Places a blue 77x77 rectangle at position (142, 100).
; PLAN: r0=142(x), r1=100(y), r2=77(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 100
LDI r2, 77
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
