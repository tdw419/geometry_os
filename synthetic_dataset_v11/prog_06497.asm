; DESCRIPTION: Renders a yellow line between points (202, 207) and (238, 57).
; PLAN: r0=202(x1), r1=207(y1), r2=238(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 207
LDI r2, 238
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
