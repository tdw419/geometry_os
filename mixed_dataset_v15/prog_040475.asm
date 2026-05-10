; DESCRIPTION: Renders a green line between points (406, 180) and (421, 39).
; PLAN: r0=406(x1), r1=180(y1), r2=421(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 180
LDI r2, 421
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
