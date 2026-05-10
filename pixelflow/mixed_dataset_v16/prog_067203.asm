; DESCRIPTION: Runs a simple loop 13 times, decrementing a counter each iteration.
; PLAN: r0=13(x), r1=132(y), r2=1(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 132
LDI r2, 1
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
