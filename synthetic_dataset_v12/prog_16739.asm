; DESCRIPTION: Renders a green line between points (135, 35) and (242, 250).
; PLAN: r0=135(x1), r1=35(y1), r2=242(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 35
LDI r2, 242
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
