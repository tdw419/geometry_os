; DESCRIPTION: Renders a green line between points (197, 64) and (62, 60).
; PLAN: r0=197(x1), r1=64(y1), r2=62(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 64
LDI r2, 62
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
