; DESCRIPTION: Renders a orange line between points (51, 64) and (340, 154).
; PLAN: r0=51(x1), r1=64(y1), r2=340(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 64
LDI r2, 340
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
