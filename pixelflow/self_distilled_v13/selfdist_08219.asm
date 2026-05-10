; DESCRIPTION: Counts from 46 down to 0 using a decrement loop.
; PLAN: r0=46(x1), r1=46(y1), r2=0(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 46
LDI r2, 0
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
