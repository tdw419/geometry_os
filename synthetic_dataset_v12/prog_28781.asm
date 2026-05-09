; DESCRIPTION: Draws a cyan line from (100, 232) to (254, 96).
; PLAN: r0=100(x1), r1=232(y1), r2=254(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 232
LDI r2, 254
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
