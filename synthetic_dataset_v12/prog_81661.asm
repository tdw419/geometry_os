; DESCRIPTION: Renders a cyan line between points (321, 111) and (375, 136).
; PLAN: r0=321(x1), r1=111(y1), r2=375(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 111
LDI r2, 375
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
