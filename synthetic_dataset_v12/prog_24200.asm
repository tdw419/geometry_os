; DESCRIPTION: Places a yellow 11x77 rectangle at position (53, 22).
; PLAN: r0=53(x), r1=22(y), r2=11(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 22
LDI r2, 11
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
