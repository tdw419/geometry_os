; DESCRIPTION: Renders a green line between points (291, 92) and (131, 223).
; PLAN: r0=291(x1), r1=92(y1), r2=131(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 92
LDI r2, 131
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
