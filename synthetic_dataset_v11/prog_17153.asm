; DESCRIPTION: Renders a red line between points (177, 103) and (242, 73).
; PLAN: r0=177(x1), r1=103(y1), r2=242(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 103
LDI r2, 242
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
