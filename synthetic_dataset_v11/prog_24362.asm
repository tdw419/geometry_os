; DESCRIPTION: Renders a green line between points (247, 66) and (242, 1).
; PLAN: r0=247(x1), r1=66(y1), r2=242(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 66
LDI r2, 242
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
