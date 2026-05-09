; DESCRIPTION: Renders a green line between points (219, 39) and (143, 132).
; PLAN: r0=219(x1), r1=39(y1), r2=143(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 39
LDI r2, 143
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
