; DESCRIPTION: Renders a magenta line between points (346, 48) and (318, 33).
; PLAN: r0=346(x1), r1=48(y1), r2=318(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 48
LDI r2, 318
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
