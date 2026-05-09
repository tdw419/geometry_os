; DESCRIPTION: Renders a yellow line between points (55, 59) and (107, 236).
; PLAN: r0=55(x1), r1=59(y1), r2=107(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 59
LDI r2, 107
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
