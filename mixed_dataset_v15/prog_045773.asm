; DESCRIPTION: Renders a green line between points (289, 173) and (262, 220).
; PLAN: r0=289(x1), r1=173(y1), r2=262(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 173
LDI r2, 262
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
