; DESCRIPTION: Renders a blue line segment connecting (177, 143) to (265, 128).
; PLAN: r0=177(x1), r1=143(y1), r2=265(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 143
LDI r2, 265
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
