; DESCRIPTION: Renders a cyan line between points (301, 217) and (313, 189).
; PLAN: r0=301(x1), r1=217(y1), r2=313(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 217
LDI r2, 313
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
