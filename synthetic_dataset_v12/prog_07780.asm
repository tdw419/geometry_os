; DESCRIPTION: Draws a cyan line from (474, 17) to (390, 194).
; PLAN: r0=474(x1), r1=17(y1), r2=390(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 17
LDI r2, 390
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
