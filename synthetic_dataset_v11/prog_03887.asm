; DESCRIPTION: Renders a purple line between points (242, 161) and (161, 27).
; PLAN: r0=242(x1), r1=161(y1), r2=161(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 161
LDI r2, 161
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
