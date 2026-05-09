; DESCRIPTION: Renders a green line between points (53, 108) and (250, 146).
; PLAN: r0=53(x1), r1=108(y1), r2=250(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 108
LDI r2, 250
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
