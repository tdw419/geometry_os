; DESCRIPTION: Renders a magenta line between points (465, 75) and (394, 188).
; PLAN: r0=465(x1), r1=75(y1), r2=394(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 75
LDI r2, 394
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
