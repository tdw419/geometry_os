; DESCRIPTION: Renders a magenta line between points (487, 8) and (319, 10).
; PLAN: r0=487(x1), r1=8(y1), r2=319(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 8
LDI r2, 319
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
