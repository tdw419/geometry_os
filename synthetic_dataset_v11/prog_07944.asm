; DESCRIPTION: Renders a purple line between points (127, 173) and (225, 244).
; PLAN: r0=127(x1), r1=173(y1), r2=225(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 173
LDI r2, 225
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
