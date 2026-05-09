; DESCRIPTION: Renders a green line between points (19, 240) and (60, 33).
; PLAN: r0=19(x1), r1=240(y1), r2=60(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 240
LDI r2, 60
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
