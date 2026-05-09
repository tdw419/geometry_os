; DESCRIPTION: Draws a black line from (27, 242) to (486, 119).
; PLAN: r0=27(x1), r1=242(y1), r2=486(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 242
LDI r2, 486
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
