; DESCRIPTION: Draws a cyan line from (151, 153) to (254, 28).
; PLAN: r0=151(x1), r1=153(y1), r2=254(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 153
LDI r2, 254
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
