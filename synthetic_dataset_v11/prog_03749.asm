; DESCRIPTION: Renders a yellow line between points (109, 173) and (197, 237).
; PLAN: r0=109(x1), r1=173(y1), r2=197(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 173
LDI r2, 197
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
