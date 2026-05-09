; DESCRIPTION: Renders a black line between points (230, 171) and (387, 39).
; PLAN: r0=230(x1), r1=171(y1), r2=387(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 171
LDI r2, 387
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
