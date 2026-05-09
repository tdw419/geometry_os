; DESCRIPTION: Renders a magenta line between points (126, 32) and (363, 175).
; PLAN: r0=126(x1), r1=32(y1), r2=363(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 32
LDI r2, 363
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
