; DESCRIPTION: Draws a black line from (216, 113) to (340, 64).
; PLAN: r0=216(x1), r1=113(y1), r2=340(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 113
LDI r2, 340
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
