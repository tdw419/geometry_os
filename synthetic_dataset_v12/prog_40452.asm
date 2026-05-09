; DESCRIPTION: Renders a green line between points (415, 175) and (0, 222).
; PLAN: r0=415(x1), r1=175(y1), r2=0(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 175
LDI r2, 0
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
