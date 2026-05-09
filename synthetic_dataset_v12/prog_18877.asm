; DESCRIPTION: Renders a green line between points (391, 202) and (128, 84).
; PLAN: r0=391(x1), r1=202(y1), r2=128(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 202
LDI r2, 128
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
