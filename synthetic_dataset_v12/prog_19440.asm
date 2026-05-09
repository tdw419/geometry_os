; DESCRIPTION: Renders a red line between points (32, 222) and (310, 6).
; PLAN: r0=32(x1), r1=222(y1), r2=310(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 222
LDI r2, 310
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
