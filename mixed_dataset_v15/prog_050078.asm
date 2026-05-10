; DESCRIPTION: Renders a green line between points (146, 107) and (191, 131).
; PLAN: r0=146(x1), r1=107(y1), r2=191(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 107
LDI r2, 191
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
