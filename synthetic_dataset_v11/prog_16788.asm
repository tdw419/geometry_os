; DESCRIPTION: Draws a black line from (209, 51) to (243, 90).
; PLAN: r0=209(x1), r1=51(y1), r2=243(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 51
LDI r2, 243
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
