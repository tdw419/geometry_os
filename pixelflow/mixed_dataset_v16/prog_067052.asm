; DESCRIPTION: Renders a orange line between points (166, 6) and (242, 192).
; PLAN: r0=166(x1), r1=6(y1), r2=242(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 6
LDI r2, 242
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
