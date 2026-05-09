; DESCRIPTION: Renders a blue line between points (10, 223) and (413, 215).
; PLAN: r0=10(x1), r1=223(y1), r2=413(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 223
LDI r2, 413
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
