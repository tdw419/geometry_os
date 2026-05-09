; DESCRIPTION: Renders a green line between points (242, 25) and (55, 126).
; PLAN: r0=242(x1), r1=25(y1), r2=55(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 25
LDI r2, 55
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
