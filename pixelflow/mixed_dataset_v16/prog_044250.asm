; DESCRIPTION: Renders a green line between points (421, 60) and (243, 159).
; PLAN: r0=421(x1), r1=60(y1), r2=243(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 60
LDI r2, 243
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
