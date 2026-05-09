; DESCRIPTION: Renders a green line between points (46, 4) and (92, 146).
; PLAN: r0=46(x1), r1=4(y1), r2=92(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 4
LDI r2, 92
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
