; DESCRIPTION: Renders a yellow line between points (42, 182) and (64, 247).
; PLAN: r0=42(x1), r1=182(y1), r2=64(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 182
LDI r2, 64
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
