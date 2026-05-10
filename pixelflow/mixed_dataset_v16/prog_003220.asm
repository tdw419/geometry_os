; DESCRIPTION: Renders a magenta line between points (499, 28) and (164, 255).
; PLAN: r0=499(x1), r1=28(y1), r2=164(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 28
LDI r2, 164
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
