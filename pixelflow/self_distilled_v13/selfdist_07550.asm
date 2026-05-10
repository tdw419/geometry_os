; DESCRIPTION: Counts from 8 down to 0 using a decrement loop.
; PLAN: r0=8(x1), r1=8(y1), r2=0(x2), r3=1(y2), r4=0x00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 8
LDI r2, 0
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
