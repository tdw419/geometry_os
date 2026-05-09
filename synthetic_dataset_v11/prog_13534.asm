; DESCRIPTION: Renders a green line between points (238, 177) and (137, 228).
; PLAN: r0=238(x1), r1=177(y1), r2=137(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 177
LDI r2, 137
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
