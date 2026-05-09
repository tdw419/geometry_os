; DESCRIPTION: Draws a black line from (12, 9) to (202, 7).
; PLAN: r0=12(x1), r1=9(y1), r2=202(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 9
LDI r2, 202
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
