; DESCRIPTION: Counts from 24 down to 0 using a decrement loop.
; PLAN: r0=24(x1), r1=24(y1), r2=0(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 24
LDI r2, 0
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
