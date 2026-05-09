; DESCRIPTION: Renders a green line between points (468, 130) and (481, 102).
; PLAN: r0=468(x1), r1=130(y1), r2=481(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 130
LDI r2, 481
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
