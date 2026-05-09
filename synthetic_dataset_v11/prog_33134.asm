; DESCRIPTION: Draws a black line from (240, 61) to (143, 29).
; PLAN: r0=240(x1), r1=61(y1), r2=143(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 61
LDI r2, 143
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
