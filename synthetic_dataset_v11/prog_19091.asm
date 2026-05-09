; DESCRIPTION: Draws a cyan line from (97, 1) to (141, 138).
; PLAN: r0=97(x1), r1=1(y1), r2=141(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 1
LDI r2, 141
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
