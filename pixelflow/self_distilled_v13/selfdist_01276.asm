; DESCRIPTION: Runs a simple loop 32 times, decrementing a counter each iteration.
; PLAN: r0=34(x), r1=106(y), r2=1(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 106
LDI r2, 1
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
