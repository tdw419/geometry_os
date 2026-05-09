; DESCRIPTION: Renders a white line between points (0, 238) and (156, 146).
; PLAN: r0=0(x1), r1=238(y1), r2=156(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 238
LDI r2, 156
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
