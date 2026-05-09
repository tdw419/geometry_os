; DESCRIPTION: Draws a black line from (172, 226) to (200, 173).
; PLAN: r0=172(x1), r1=226(y1), r2=200(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 226
LDI r2, 200
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
