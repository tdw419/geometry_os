; DESCRIPTION: Counts from 22 down to 0 using a decrement loop.
; PLAN: r0=22(x1), r1=22(y1), r2=0(x2), r3=1(y2), r4=0x00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 22
LDI r2, 0
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
