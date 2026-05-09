; DESCRIPTION: Places a yellow 112x23 rectangle at position (53, 77).
; PLAN: r0=53(x), r1=77(y), r2=112(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 77
LDI r2, 112
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
