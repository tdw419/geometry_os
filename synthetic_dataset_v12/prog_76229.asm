; DESCRIPTION: Renders a magenta line between points (300, 206) and (21, 61).
; PLAN: r0=300(x1), r1=206(y1), r2=21(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 206
LDI r2, 21
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
