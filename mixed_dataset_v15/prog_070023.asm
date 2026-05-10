; DESCRIPTION: Counts from 45 down to 0 using a decrement loop.
; PLAN: r0=45(x1), r1=45(y1), r2=0(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 45
LDI r2, 0
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
