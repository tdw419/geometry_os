; DESCRIPTION: Renders a green line between points (302, 60) and (293, 21).
; PLAN: r0=302(x1), r1=60(y1), r2=293(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 60
LDI r2, 293
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
