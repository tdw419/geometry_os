; DESCRIPTION: Renders a green line between points (197, 234) and (90, 48).
; PLAN: r0=197(x1), r1=234(y1), r2=90(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 234
LDI r2, 90
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
