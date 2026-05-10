; DESCRIPTION: Places a blue 77x56 rectangle at position (249, 138).
; PLAN: r0=249(x), r1=138(y), r2=77(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 138
LDI r2, 77
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
