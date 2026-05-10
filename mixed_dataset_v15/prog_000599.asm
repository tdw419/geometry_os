; DESCRIPTION: Counts from 41 down to 0 using a decrement loop.
; PLAN: r0=41(x1), r1=41(y1), r2=0(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 41
LDI r2, 0
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
