; DESCRIPTION: Renders a magenta line between points (203, 199) and (152, 231).
; PLAN: r0=203(x1), r1=199(y1), r2=152(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 199
LDI r2, 152
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
