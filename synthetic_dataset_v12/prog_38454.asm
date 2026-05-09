; DESCRIPTION: Draws a black line from (214, 171) to (151, 141).
; PLAN: r0=214(x1), r1=171(y1), r2=151(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 171
LDI r2, 151
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
