; DESCRIPTION: Renders a green line between points (370, 210) and (385, 250).
; PLAN: r0=370(x1), r1=210(y1), r2=385(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 210
LDI r2, 385
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
