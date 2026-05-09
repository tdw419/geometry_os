; DESCRIPTION: Renders a magenta line between points (198, 116) and (128, 133).
; PLAN: r0=198(x1), r1=116(y1), r2=128(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 116
LDI r2, 128
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
