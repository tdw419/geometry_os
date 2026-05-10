; DESCRIPTION: Renders a blue line between points (96, 173) and (281, 254).
; PLAN: r0=96(x1), r1=173(y1), r2=281(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 173
LDI r2, 281
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
