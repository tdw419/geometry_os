; DESCRIPTION: Counts from 19 down to 0 using a decrement loop.
; PLAN: r0=19(x1), r1=19(y1), r2=0(x2), r3=0(y2), r4=0x00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 19
LDI r2, 0
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
