; DESCRIPTION: Draws a black line from (465, 135) to (286, 243).
; PLAN: r0=465(x1), r1=135(y1), r2=286(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 135
LDI r2, 286
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
