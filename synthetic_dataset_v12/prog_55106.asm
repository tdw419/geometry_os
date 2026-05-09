; DESCRIPTION: Renders a green line between points (156, 7) and (393, 57).
; PLAN: r0=156(x1), r1=7(y1), r2=393(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 7
LDI r2, 393
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
