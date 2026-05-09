; DESCRIPTION: Draws a black line from (173, 202) to (141, 138).
; PLAN: r0=173(x1), r1=202(y1), r2=141(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 202
LDI r2, 141
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
