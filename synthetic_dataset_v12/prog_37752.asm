; DESCRIPTION: Renders a blue line between points (509, 228) and (337, 18).
; PLAN: r0=509(x1), r1=228(y1), r2=337(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 228
LDI r2, 337
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
