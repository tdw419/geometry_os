; DESCRIPTION: Renders a purple line between points (242, 48) and (481, 91).
; PLAN: r0=242(x1), r1=48(y1), r2=481(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 48
LDI r2, 481
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
