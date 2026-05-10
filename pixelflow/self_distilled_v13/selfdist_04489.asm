; DESCRIPTION: Runs a simple loop 12 times, decrementing a counter each iteration.
; PLAN: r0=4(x), r1=125(y), r2=12(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 125
LDI r2, 12
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
