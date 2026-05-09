; DESCRIPTION: Renders a yellow line between points (160, 173) and (39, 1).
; PLAN: r0=160(x1), r1=173(y1), r2=39(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 173
LDI r2, 39
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
