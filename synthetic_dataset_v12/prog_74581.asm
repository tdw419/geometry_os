; DESCRIPTION: Renders a cyan line between points (100, 131) and (250, 165).
; PLAN: r0=100(x1), r1=131(y1), r2=250(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 131
LDI r2, 250
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
