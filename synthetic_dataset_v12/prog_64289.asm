; DESCRIPTION: Renders a magenta line between points (408, 98) and (64, 83).
; PLAN: r0=408(x1), r1=98(y1), r2=64(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 98
LDI r2, 64
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
