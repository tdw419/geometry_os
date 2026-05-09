; DESCRIPTION: Renders a magenta line between points (156, 153) and (242, 199).
; PLAN: r0=156(x1), r1=153(y1), r2=242(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 153
LDI r2, 242
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
