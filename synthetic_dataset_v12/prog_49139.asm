; DESCRIPTION: Renders a magenta line between points (346, 189) and (400, 61).
; PLAN: r0=346(x1), r1=189(y1), r2=400(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 189
LDI r2, 400
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
