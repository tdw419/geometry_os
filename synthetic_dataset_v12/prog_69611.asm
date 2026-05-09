; DESCRIPTION: Renders a magenta line between points (156, 0) and (504, 48).
; PLAN: r0=156(x1), r1=0(y1), r2=504(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 0
LDI r2, 504
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
