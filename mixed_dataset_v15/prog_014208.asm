; DESCRIPTION: Renders a magenta line between points (243, 182) and (440, 253).
; PLAN: r0=243(x1), r1=182(y1), r2=440(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 182
LDI r2, 440
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
