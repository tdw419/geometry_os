; DESCRIPTION: Renders a magenta line between points (52, 107) and (111, 242).
; PLAN: r0=52(x1), r1=107(y1), r2=111(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 107
LDI r2, 111
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
