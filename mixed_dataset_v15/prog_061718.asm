; DESCRIPTION: Renders a cyan line between points (500, 240) and (142, 222).
; PLAN: r0=500(x1), r1=240(y1), r2=142(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 240
LDI r2, 142
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
