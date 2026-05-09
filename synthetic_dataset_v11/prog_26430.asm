; DESCRIPTION: Renders a green line between points (111, 128) and (63, 89).
; PLAN: r0=111(x1), r1=128(y1), r2=63(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 128
LDI r2, 63
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
