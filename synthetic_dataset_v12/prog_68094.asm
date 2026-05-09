; DESCRIPTION: Draws a black line from (386, 245) to (221, 36).
; PLAN: r0=386(x1), r1=245(y1), r2=221(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 245
LDI r2, 221
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
