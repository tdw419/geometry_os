; DESCRIPTION: Renders a magenta line between points (392, 249) and (75, 237).
; PLAN: r0=392(x1), r1=249(y1), r2=75(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 249
LDI r2, 75
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
