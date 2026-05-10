; DESCRIPTION: Runs a simple loop 28 times, decrementing a counter each iteration.
; PLAN: r0=371(x), r1=10(y), r2=0(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 10
LDI r2, 0
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
