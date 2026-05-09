; DESCRIPTION: Renders a yellow line between points (38, 228) and (396, 96).
; PLAN: r0=38(x1), r1=228(y1), r2=396(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 228
LDI r2, 396
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
