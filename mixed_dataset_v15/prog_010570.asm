; DESCRIPTION: Draws a cyan line from (100, 33) to (449, 78).
; PLAN: r0=100(x1), r1=33(y1), r2=449(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 33
LDI r2, 449
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
