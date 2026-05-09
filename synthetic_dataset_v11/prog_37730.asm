; DESCRIPTION: Renders a orange line between points (182, 240) and (242, 89).
; PLAN: r0=182(x1), r1=240(y1), r2=242(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 240
LDI r2, 242
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
