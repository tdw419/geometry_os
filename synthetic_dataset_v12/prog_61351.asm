; DESCRIPTION: Renders a magenta line between points (243, 109) and (425, 192).
; PLAN: r0=243(x1), r1=109(y1), r2=425(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 109
LDI r2, 425
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
