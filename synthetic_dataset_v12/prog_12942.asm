; DESCRIPTION: Draws a black line from (92, 19) to (27, 200).
; PLAN: r0=92(x1), r1=19(y1), r2=27(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 19
LDI r2, 27
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
