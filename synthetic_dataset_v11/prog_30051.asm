; DESCRIPTION: Renders a white line between points (240, 222) and (170, 198).
; PLAN: r0=240(x1), r1=222(y1), r2=170(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 222
LDI r2, 170
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
