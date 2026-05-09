; DESCRIPTION: Renders a cyan line between points (366, 133) and (278, 240).
; PLAN: r0=366(x1), r1=133(y1), r2=278(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 133
LDI r2, 278
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
