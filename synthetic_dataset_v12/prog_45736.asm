; DESCRIPTION: Renders a magenta line between points (160, 231) and (200, 27).
; PLAN: r0=160(x1), r1=231(y1), r2=200(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 231
LDI r2, 200
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
