; DESCRIPTION: Renders a magenta line between points (192, 31) and (27, 86).
; PLAN: r0=192(x1), r1=31(y1), r2=27(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 31
LDI r2, 27
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
