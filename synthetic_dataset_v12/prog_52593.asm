; DESCRIPTION: Renders a yellow line between points (454, 173) and (481, 237).
; PLAN: r0=454(x1), r1=173(y1), r2=481(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 173
LDI r2, 481
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
