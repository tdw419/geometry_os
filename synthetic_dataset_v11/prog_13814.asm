; DESCRIPTION: Places a cyan line segment connecting (24, 205) to (124, 51).
; PLAN: r0=24(x1), r1=205(y1), r2=124(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 205
LDI r2, 124
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
