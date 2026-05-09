; DESCRIPTION: Renders a magenta line between points (202, 137) and (111, 190).
; PLAN: r0=202(x1), r1=137(y1), r2=111(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 137
LDI r2, 111
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
