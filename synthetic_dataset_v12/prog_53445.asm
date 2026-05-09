; DESCRIPTION: Renders a green line between points (63, 96) and (99, 242).
; PLAN: r0=63(x1), r1=96(y1), r2=99(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 96
LDI r2, 99
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
