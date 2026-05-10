; DESCRIPTION: Runs a simple loop 24 times, decrementing a counter each iteration.
; PLAN: r0=442(x), r1=24(y), r2=24(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 24
LDI r2, 24
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
