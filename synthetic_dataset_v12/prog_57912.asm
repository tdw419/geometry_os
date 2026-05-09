; DESCRIPTION: Renders a cyan line between points (230, 181) and (122, 13).
; PLAN: r0=230(x1), r1=181(y1), r2=122(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 181
LDI r2, 122
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
