; DESCRIPTION: Draws a black line from (44, 109) to (202, 24).
; PLAN: r0=44(x1), r1=109(y1), r2=202(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 109
LDI r2, 202
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
