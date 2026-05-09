; DESCRIPTION: Renders a magenta line between points (470, 82) and (271, 87).
; PLAN: r0=470(x1), r1=82(y1), r2=271(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 82
LDI r2, 271
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
