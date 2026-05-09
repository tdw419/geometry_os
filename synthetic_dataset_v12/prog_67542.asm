; DESCRIPTION: Renders a green line between points (157, 63) and (454, 28).
; PLAN: r0=157(x1), r1=63(y1), r2=454(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 63
LDI r2, 454
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
