; DESCRIPTION: Places a cyan line segment connecting (241, 214) to (15, 196).
; PLAN: r0=241(x1), r1=214(y1), r2=15(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 214
LDI r2, 15
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
