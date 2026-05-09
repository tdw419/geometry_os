; DESCRIPTION: Places a yellow 119x77 rectangle at position (56, 175).
; PLAN: r0=56(x), r1=175(y), r2=119(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 175
LDI r2, 119
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
