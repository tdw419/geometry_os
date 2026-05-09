; DESCRIPTION: Renders a yellow line between points (167, 242) and (400, 2).
; PLAN: r0=167(x1), r1=242(y1), r2=400(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 242
LDI r2, 400
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
