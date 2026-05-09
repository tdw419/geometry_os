; DESCRIPTION: Draws a black line from (46, 179) to (135, 138).
; PLAN: r0=46(x1), r1=179(y1), r2=135(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 179
LDI r2, 135
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
