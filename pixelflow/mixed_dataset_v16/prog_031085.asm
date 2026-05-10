; DESCRIPTION: Renders a magenta line between points (509, 133) and (502, 20).
; PLAN: r0=509(x1), r1=133(y1), r2=502(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 133
LDI r2, 502
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
