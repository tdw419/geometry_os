; DESCRIPTION: Renders a magenta line between points (236, 111) and (281, 242).
; PLAN: r0=236(x1), r1=111(y1), r2=281(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 111
LDI r2, 281
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
