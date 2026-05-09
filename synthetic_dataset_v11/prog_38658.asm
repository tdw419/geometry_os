; DESCRIPTION: Draws a black line from (77, 46) to (32, 14).
; PLAN: r0=77(x1), r1=46(y1), r2=32(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 46
LDI r2, 32
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
