; DESCRIPTION: Renders a green line between points (11, 154) and (65, 48).
; PLAN: r0=11(x1), r1=154(y1), r2=65(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 154
LDI r2, 65
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
