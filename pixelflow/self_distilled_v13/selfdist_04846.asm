; DESCRIPTION: Counts from 30 down to 0 using a decrement loop.
; PLAN: r0=30(x1), r1=30(y1), r2=0(x2), r3=0(y2), r4=0x00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 30
LDI r2, 0
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
