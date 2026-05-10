; DESCRIPTION: Renders a black line between points (387, 127) and (90, 193).
; PLAN: r0=387(x1), r1=127(y1), r2=90(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 127
LDI r2, 90
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
