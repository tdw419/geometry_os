; DESCRIPTION: Renders a black line between points (415, 47) and (234, 143).
; PLAN: r0=415(x1), r1=47(y1), r2=234(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 47
LDI r2, 234
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
