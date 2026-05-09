; DESCRIPTION: Renders a white line between points (240, 193) and (72, 222).
; PLAN: r0=240(x1), r1=193(y1), r2=72(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 193
LDI r2, 72
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
