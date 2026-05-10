; DESCRIPTION: Renders a green line between points (269, 65) and (92, 46).
; PLAN: r0=269(x1), r1=65(y1), r2=92(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 65
LDI r2, 92
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
