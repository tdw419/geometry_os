; DESCRIPTION: Draws a black line from (161, 239) to (447, 180).
; PLAN: r0=161(x1), r1=239(y1), r2=447(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 239
LDI r2, 447
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
