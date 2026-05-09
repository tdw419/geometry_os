; DESCRIPTION: Places a cyan line segment connecting (111, 100) to (312, 196).
; PLAN: r0=111(x1), r1=100(y1), r2=312(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 100
LDI r2, 312
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
