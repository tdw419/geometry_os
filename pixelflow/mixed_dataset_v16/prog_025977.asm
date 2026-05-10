; DESCRIPTION: Draws a black line from (508, 210) to (4, 83).
; PLAN: r0=508(x1), r1=210(y1), r2=4(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 210
LDI r2, 4
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
