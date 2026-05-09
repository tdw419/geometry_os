; DESCRIPTION: Draws a black line from (191, 236) to (33, 14).
; PLAN: r0=191(x1), r1=236(y1), r2=33(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 236
LDI r2, 33
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
