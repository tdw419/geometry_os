; DESCRIPTION: Renders a yellow line between points (421, 122) and (305, 164).
; PLAN: r0=421(x1), r1=122(y1), r2=305(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 122
LDI r2, 305
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
