; DESCRIPTION: Draws a black line from (72, 96) to (180, 36).
; PLAN: r0=72(x1), r1=96(y1), r2=180(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 96
LDI r2, 180
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
