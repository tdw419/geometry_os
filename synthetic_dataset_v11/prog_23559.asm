; DESCRIPTION: Draws a black line from (193, 215) to (73, 22).
; PLAN: r0=193(x1), r1=215(y1), r2=73(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 215
LDI r2, 73
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
