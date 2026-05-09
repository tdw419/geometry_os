; DESCRIPTION: Renders a magenta line between points (80, 64) and (275, 209).
; PLAN: r0=80(x1), r1=64(y1), r2=275(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 64
LDI r2, 275
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
