; DESCRIPTION: Renders a magenta line between points (285, 154) and (455, 108).
; PLAN: r0=285(x1), r1=154(y1), r2=455(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 154
LDI r2, 455
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
