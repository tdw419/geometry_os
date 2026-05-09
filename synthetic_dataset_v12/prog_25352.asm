; DESCRIPTION: Places a cyan line segment connecting (214, 51) to (111, 11).
; PLAN: r0=214(x1), r1=51(y1), r2=111(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 51
LDI r2, 111
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
