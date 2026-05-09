; DESCRIPTION: Draws a black line from (45, 188) to (202, 47).
; PLAN: r0=45(x1), r1=188(y1), r2=202(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 188
LDI r2, 202
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
